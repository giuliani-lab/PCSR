% This script pulls onsets and durations from the PC015 R1 file to create FX multicond files
%
% D.Cos 4/2019

%% Load data and intialize variables
sub = '015';
fileName = '~/Documents/code/sanlab/PCSR_scripts/task/PC015_pictureR1_modified.txt';
run = {'R1'}; % add runs names here
writeDir = '~/Documents/code/sanlab/PCSR_scripts/fMRI/fx/multiconds/ROC/condition';
studyName = 'PC';
filePattern = 'PIC_Picture';
nConds = 4;
condNames = {'lookNeutral', 'lookNoCrave', 'lookCrave', 'reappraiseCrave', 'instructions', 'ratings'};

%% Load file and save names, onsets, and durations as a .mat file

% log missing trial info
missing{1,1} = sub;

if exist(fileName)
    tdfread(fileName);

    %% Initialize names 
    names = condNames;

    %% Pull onsets
    for a = 1:nConds
        idxs = find(Tag == a);
        idxs_image = idxs(2:3:length(idxs));
        idxs_ratings_cond = idxs(3:3:length(idxs));
        ratings_cond = Response(idxs_ratings_cond);
        onsets{a} = Onset(idxs_image);
        onsets{a}(isnan(ratings_cond)) = []; % remove missing trials
    end

    % Instructions
    idxs_all = find(~isnan(Tag));
    idxs_instructions = idxs_all(1:3:length(idxs_all));
    onsets{nConds+1} = Onset(idxs_instructions);
    onsets{nConds+1}(onsets{nConds+1} == 0) = []; % remove incomplete trials

    % Ratings
    idxs_ratings = idxs_all(3:3:length(idxs_all));
    ratings = Response(idxs_ratings);
    onsets{nConds+2} = Onset(idxs_ratings);
    onsets{nConds+2}(isnan(ratings)) = []; % remove missing trials

    %% Create durations
    durations = onsets;

    % image conditions
    for b = 1:nConds
        durations{b} = repelem(5, length(durations{b}))';
    end

    % instructions
    durations{nConds+1} = repelem(2, length(durations{nConds+1}))';

    % ratings (duration = rt)
    durations{nConds+2} = RT(idxs_ratings);
    durations{nConds+2}(durations{nConds+2} == 0) = []; % remove missing trials

    %% Pull onsets and durations for missed responses (if any)
    % Missing responses are coded from image onset to rating
    % offset (9 seconds). Exclude incomplete trials.
    if sum(isnan(ratings)) > 0
        idxs_missing = idxs_ratings(isnan(ratings))-1;
        if sum(Onset(idxs_missing)) > 0
            names(nConds+3) = {'noResponse'};
            onsets(nConds+3) = {Onset(idxs_missing)};
            onsets{nConds+3}(onsets{nConds+3} == 0) = []; % remove incomplete trials
            durations(nConds+3) = {repelem(9, length(onsets{nConds+3}))'};
        end
    end 

    %% Define output file name
    outputName = sprintf('%s%s_ROC%d.mat', studyName, sub, 1);

    %% Save as .mat file and clear
    if ~exist(writeDir); mkdir(writeDir); end

    if ~(isempty(onsets{1}) && isempty(onsets{2}))
        save(fullfile(writeDir,outputName),'names','onsets','durations');
    else
        warning('File is empty. Did not save %s.', outputName);
    end
    
    %% Log missing trial info
    missing{1,2} = sum(isnan(ratings));
end

% save missing trial info
missing(cellfun('isempty', missing)) = {NaN};
table = cell2table(missing,'VariableNames',[{'subjectID'}, run{:}])
writetable(table,fullfile(writeDir, sprintf('missing_%s%s.csv', studyName, sub)),'Delimiter',',')
fprintf('\nMissing trial info saved in %s\n', fullfile(writeDir, sprintf('missing_%s%s.csv', studyName, sub)))