%-----------------------------------------------------------------------
% Job saved on 29-Dec-2018 16:53:58 by cfg_util (rev $Rev: 6942 $)
% spm SPM - SPM12 (7219)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.spm.stats.fmri_est.spmmat = {'/projects/giuliani_lab/shared/PCSR/nonbids_data/fMRI/fx/models/food/condition/sub-PC001/SPM.mat'};
matlabbatch{1}.spm.stats.fmri_est.write_residuals = 1;
matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;
matlabbatch{2}.spm.stats.con.spmmat(1) = cfg_dep('Model estimation: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.con.consess{1}.tcon.name = 'lookNeutral > rest';
matlabbatch{2}.spm.stats.con.consess{1}.tcon.weights = [1 0 0 0 0 0];
matlabbatch{2}.spm.stats.con.consess{1}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{2}.tcon.name = 'lookNoCrave > rest';
matlabbatch{2}.spm.stats.con.consess{2}.tcon.weights = [0 1 0 0 0 0];
matlabbatch{2}.spm.stats.con.consess{2}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{3}.tcon.name = 'lookCrave > rest';
matlabbatch{2}.spm.stats.con.consess{3}.tcon.weights = [0 0 1 0 0 0];
matlabbatch{2}.spm.stats.con.consess{3}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{4}.tcon.name = 'reappraiseCrave > rest';
matlabbatch{2}.spm.stats.con.consess{4}.tcon.weights = [0 0 0 1 0 0];
matlabbatch{2}.spm.stats.con.consess{4}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{5}.tcon.name = 'instructions > rest';
matlabbatch{2}.spm.stats.con.consess{5}.tcon.weights = [0 0 0 0 1 0];
matlabbatch{2}.spm.stats.con.consess{5}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{6}.tcon.name = 'ratings > rest';
matlabbatch{2}.spm.stats.con.consess{6}.tcon.weights = [0 0 0 0 0 1];
matlabbatch{2}.spm.stats.con.consess{6}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{7}.tcon.name = 'reappraiseCrave > lookCrave';
matlabbatch{2}.spm.stats.con.consess{7}.tcon.weights = [0 0 -1 1 0 0];
matlabbatch{2}.spm.stats.con.consess{7}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{8}.tcon.name = 'lookCrave > lookNeutral';
matlabbatch{2}.spm.stats.con.consess{8}.tcon.weights = [-1 0 1 0 0 0];
matlabbatch{2}.spm.stats.con.consess{8}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.consess{9}.tcon.name = 'reappraiseCrave > lookNeutral';
matlabbatch{2}.spm.stats.con.consess{9}.tcon.weights = [-1 0 0 1 0 0];
matlabbatch{2}.spm.stats.con.consess{9}.tcon.sessrep = 'both';
matlabbatch{2}.spm.stats.con.delete = 0;
