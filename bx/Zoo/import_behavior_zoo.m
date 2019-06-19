%change direction to where the file lives
cd '/Users/giuliani/OneDrive - University Of Oregon/PCSR/BehavioralData/Zoo/Converted Files'

%read in .txt file and save as .xlsx
clear all

%declare subjectcounter variable and set at 1 for start of The Loop
subjectcounter = 1

%create a blank matrix for eventual insertion of cropped data
masterdata = zeros(400,100);

%[1001  1002	1004	1009	1010	1011	1012];
for i = [2	3	4	5	6	7	8	9	10	11	12	13	14	15	17	18	20	21	22	23	24	26	27	29	30	31	33	34  35	36	37	38	39	41	42	43	44	45	46	47	48	49	50	51	52	53	54	55	56	57	58	59	60	61	62	63	64	65	66	67	68	69	70	71	72	73	74	75	76	77	78	79	80	81	82	83	84	85	86	88	89	90	92]
    
    subjecttitle = num2str(i)
    subjectcounter = subjectcounter+1
    
    
    %read in .xlsx file (make sure all files start with PC0 and then the
    %subject number)
    try
        
        data = xlsread(['PC0', subjecttitle ,'_Zoo.xlsx']);
        
        %only choose columns of interest
        %subject id, session, phase of task, trial then block, trial number, trial
        %type, iti jitter, accuracy, response (no resp = NaN), RT (0=miss),
        
        datawewant = data(:, [1,2,13,16,56,58,65,75,77,78]);
        
        %USE SOMETHING LIKE THE STATEMENT BELOW IF OUTPUT FORMAT VARIES
        %SYSTEMATICALLY ACROSS SUBJECTS
        
        %if i < 1044 | i == 1074 | i==1077 | i==1080
        %datawewant = data(:, [1,2,21,26,66,68,75,85,87,88]);
        %else
        %    datawewant = data(:, [2,3,16,22,62,64,71,81,83,84]);
        %end
        
        %loopcounter=0;
        j=0;
        
        
        %loop through pre data and identify where practice ends
        for j = 1:length(datawewant)
            isthiscellthree = datawewant(j,3);
            %loopcounter=loopcounter+1;
            
            %correct go trials
            if isthiscellthree==3
                break
            end
            
            isthiscellthree = 0;
        end
        
        %save separate matrices for overall and each block
        shaveoffpracticerows = datawewant([j:length(datawewant)],:);
        
        
        numtrialsmatrixpre = size(shaveoffpracticerows);
        numtrialspre = numtrialsmatrixpre(1,1);
        %reset the j looper
        j = 0;
        
        if numtrialspre > 0
            %if subject has all 180 trials
            
            counttrialsblock1 = sum(shaveoffpracticerows(1:numtrialspre,4)==1);
            counttrialsblock2 = sum(shaveoffpracticerows(1:numtrialspre,4)==2);
            
        else
            counttrialsblock1 = 0;
            counttrialsblock2 = 0;
        end
        
        
        %create an empty column to be added to main matrix, then add it
        emptycolumns = zeros(length(shaveoffpracticerows),1);
        newmatrix = [shaveoffpracticerows emptycolumns];
        
        
        
        
        
        %determine if trial is correct go/nogo or not
        %loop through sorted matrix and identify rows with
        %value of 1 to 4 to specify trial type
        for j = 1:length(shaveoffpracticerows)
            gonogo = shaveoffpracticerows(j,6);
            correct = shaveoffpracticerows(j,8);
            
            %correct go trials
            if and(correct==1,gonogo==1)
                newmatrix(j,11)=1;
            end
            
            %incorrect go trials
            if and(correct==0,gonogo==1)
                newmatrix(j,11)=2;
            end
            
            %correct nogo trials
            if and(correct==1,gonogo==2)
                newmatrix(j,11)=3;
            end
            
            %incorrect nogo trials
            if and(correct==0,gonogo==2)
                newmatrix(j,11)=4;
            end
            
            gonogo = 0;
            correct = 0;
        end
        
        %reset the counter but this may be totally whack..
        j=0;
        
        
        countcorrectsgosblock1 = sum(newmatrix(1:counttrialsblock1,11)==1);
        countincorrectgosblock1 = sum(newmatrix(1:counttrialsblock1,11)==2);
        countcorrectnogosblock1 = sum(newmatrix(1:counttrialsblock1,11)==3);
        countincorrectnogosblock1 = sum(newmatrix(1:counttrialsblock1,11)==4);
        
        countcorrectsgosblock2 = sum(newmatrix((counttrialsblock1+1):(counttrialsblock1+counttrialsblock2),11)==1);
        countincorrectgosblock2 = sum(newmatrix((counttrialsblock1+1):(counttrialsblock1+counttrialsblock2),11)==2);
        countcorrectnogosblock2 = sum(newmatrix((counttrialsblock1+1):(counttrialsblock1+counttrialsblock2),11)==3);
        countincorrectnogosblock2 = sum(newmatrix((counttrialsblock1+1):(counttrialsblock1+counttrialsblock2),11)==4);
        
        
        Pre_CorrectGos = sum(newmatrix(1:(counttrialsblock1+counttrialsblock2),11)==1);
        Pre_IncorrectGos = sum(newmatrix(1:(counttrialsblock1+counttrialsblock2),11)==2);
        Pre_CorrectNogos = sum(newmatrix(1:(counttrialsblock1+counttrialsblock2),11)==3);
        Pre_IncorrectNogos = sum(newmatrix(1:(counttrialsblock1+counttrialsblock2),11)==4);
        
        
        %declare a matrix/vector to store the correct go RTs in for st dev analysis
        matrixofcorrectgoRTsPre = zeros(Pre_CorrectGos,1);
        matrixofincorrectnogoRTsPre = zeros(Pre_IncorrectNogos,1);
        
        %declare matrices to store post-error slowing info
        matrixofpostcorrectgoRTsPre = zeros(Pre_CorrectGos,1);
        matrixofpostincorrectgoRTsPre = zeros(Pre_IncorrectGos,1);
        matrixofpostcorrectnogoRTsPre = zeros(Pre_CorrectNogos,1);
        matrixofpostincorrectnogoRTsPre = zeros(Pre_IncorrectNogos,1);
        
        
        runningRTtotalPre=0;
        runningnogoRTtotalPre=0;
        runningcorrectgotrialcountPre=0;
        runningincorrectnogotrialcountPre=0;
        runningnogotrialcountPre=0;
        
        runningcorrectnogotrialcountPre=0;
        
        runningpostcorrectgotrialcountPre=0;
        runningpostcorrectnogotrialcountPre=0;
        runningpostincorrectnogotrialcountPre=0;
        
        runningpostgocorrectRTtotalPre=0;
        runningpostgoincorrectRTtotalPre=0;
        runningpostnogocorrectRTtotalPre=0;
        runningpostnogoincorrectRTtotalPre=0;
        
        
        %determine if trial is correct go/nogo or not
        %loop through sorted matrix and identify rows with
        %value of 1 to 4 to specify trial type
        for k = 1:length(newmatrix)
            currenttrialRT = newmatrix(k,10);
            currenttrialtype = newmatrix(k,11);
            
            if k < length(newmatrix)
                nexttrialRT = newmatrix(k+1,10);
                nexttrialtype = newmatrix(k+1,11);
            end
            
            
            %correct go trial
            if currenttrialtype == 1
                runningRTtotalPre=runningRTtotalPre+currenttrialRT;
                runningcorrectgotrialcountPre=runningcorrectgotrialcountPre+1;
                %update correct go rts into matrix for st dev analysis
                matrixofcorrectgoRTsPre(runningcorrectgotrialcountPre,1) = currenttrialRT;
                
                %do posterror stuff if not last trial
                if and(k < length(newmatrix), nexttrialtype==1)
                    runningpostcorrectgotrialcountPre=runningpostcorrectgotrialcountPre+1;
                    matrixofpostcorrectgoRTsPre(runningpostcorrectgotrialcountPre,1) = nexttrialRT;
                end
                
            end
            
            %correct no go trial
            if currenttrialtype == 3
                runningcorrectnogotrialcountPre=runningcorrectnogotrialcountPre+1;
                %update correct go rts into matrix for st dev analysis
                
                
                %do post error stuff if not last trial
                if and(k < length(newmatrix), nexttrialtype==1)
                    runningpostcorrectnogotrialcountPre=runningpostcorrectnogotrialcountPre+1;
                    matrixofpostcorrectnogoRTsPre(runningpostcorrectnogotrialcountPre,1) = nexttrialRT;
                end
            end
            
            %incorrect no go trial
            if currenttrialtype == 4
                runningnogoRTtotalPre=runningnogoRTtotalPre+currenttrialRT;
                runningincorrectnogotrialcountPre=runningincorrectnogotrialcountPre+1;
                matrixofincorrectnogoRTsPre(runningincorrectnogotrialcountPre,1) = currenttrialRT;
                
                %do post error stuff if not last trial
                if and(k < length(newmatrix), nexttrialtype==1)
                    runningpostincorrectnogotrialcountPre=runningpostincorrectnogotrialcountPre+1;
                    matrixofpostincorrectnogoRTsPre(runningpostincorrectnogotrialcountPre,1) = nexttrialRT;
                end
            end
            
            %incorrect go trial
            currenttrialRT = 0;
        end
        
        
        tfcorrectgopre= matrixofcorrectgoRTsPre > 200;
        tfincorrectnogopre= matrixofincorrectnogoRTsPre > 200;
        
        TotalAverageRTPre_nooutliers_CorrectGo = mean(reshape(matrixofcorrectgoRTsPre(tfcorrectgopre),1,[]));
        TotalStDevRTPre_nooutliers_CorrectGo = std2(reshape(matrixofcorrectgoRTsPre(tfcorrectgopre),1,[]));
        TotalCoeffOfVariationPre_nooutliers_CorrectGo = TotalStDevRTPre_nooutliers_CorrectGo/TotalAverageRTPre_nooutliers_CorrectGo;
        
        TotalAverageRTPre_allresponses_CorrectGo = mean(matrixofcorrectgoRTsPre);
        TotalStDevRTPre_allresponses_CorrectGo = std2(matrixofcorrectgoRTsPre);
        TotalCoeffOfVariationPre_allresponses_CorrectGo = TotalStDevRTPre_allresponses_CorrectGo/TotalAverageRTPre_allresponses_CorrectGo;
        
        TotalAverageRTPre_IncorrectNogo = mean(reshape(matrixofincorrectnogoRTsPre(tfincorrectnogopre),1,[]));
        
        k=0;
        
        %grab trials counts of total Go and Nogo
        CountGoTrialsPre = Pre_CorrectGos + Pre_IncorrectGos;
        CountNogoTrialsPre = Pre_CorrectNogos + Pre_IncorrectNogos;
        
        
        %create final matrix with relevant output
        masterdata(subjectcounter,1)=str2num(subjecttitle);
        masterdata(subjectcounter,2)=CountGoTrialsPre;
        masterdata(subjectcounter,3)=CountNogoTrialsPre;
        masterdata(subjectcounter,4)=Pre_CorrectGos;
        masterdata(subjectcounter,5)=Pre_CorrectNogos;
        masterdata(subjectcounter,6)=Pre_IncorrectGos;
        masterdata(subjectcounter,7)=Pre_IncorrectNogos;
        masterdata(subjectcounter,8)=TotalAverageRTPre_nooutliers_CorrectGo;
        masterdata(subjectcounter,9)=TotalStDevRTPre_nooutliers_CorrectGo;
        masterdata(subjectcounter,10)=TotalCoeffOfVariationPre_nooutliers_CorrectGo;
        masterdata(subjectcounter,11)=TotalAverageRTPre_allresponses_CorrectGo;
        masterdata(subjectcounter,12)=TotalStDevRTPre_allresponses_CorrectGo;
        masterdata(subjectcounter,13)=TotalCoeffOfVariationPre_allresponses_CorrectGo;
        masterdata(subjectcounter,14)=countcorrectsgosblock1;
        masterdata(subjectcounter,15)=countcorrectsgosblock2;
        masterdata(subjectcounter,16)=countcorrectnogosblock1;
        masterdata(subjectcounter,17)=countcorrectnogosblock2;
        masterdata(subjectcounter,18)=countincorrectgosblock1;
        masterdata(subjectcounter,19)=countincorrectgosblock2;
        masterdata(subjectcounter,20)=countincorrectnogosblock1;
        masterdata(subjectcounter,21)=countincorrectnogosblock2;
        
        
        %catch statement for matlab command window in case of error processing file
    catch ME
        fprintf('Unable to process a Pre file for subject %s\n', subjecttitle, '!!!')
    end
    
    
end


%grab number of subjects for writing in xls output
numbersubjects=subjectcounter-1;

%grab final master matrix for writing to xls
finalmasterds=masterdata([1:subjectcounter],:);

%set file name
filename=['ZooGNG_behavioral_n=', num2str(numbersubjects), '.xls'];

%write xls file
xlswrite(filename, finalmasterds);


