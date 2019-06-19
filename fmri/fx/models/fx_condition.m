%-----------------------------------------------------------------------
% Job saved on 18-Jan-2019 18:32:53 by cfg_util (rev $Rev: 6460 $)
% spm SPM - SPM12 (6906)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/projects/giuliani_lab/shared/PCSR/bids_data/derivatives/fmriprep/sub-PC001/ses-wave1/func'};
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 's6_sub-PC001_ses-wave1_task-food_acq-1_bold_space-MNI152NLin2009cAsym_preproc.nii';
matlabbatch{1}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.dir = {'/projects/giuliani_lab/shared/PCSR/bids_data/derivatives/fmriprep/sub-PC001/ses-wave1/func'};
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.filter = 's6_sub-PC001_ses-wave1_task-food_acq-2_bold_space-MNI152NLin2009cAsym_preproc.nii';
matlabbatch{2}.cfg_basicio.file_dir.file_ops.file_fplist.rec = 'FPList';
matlabbatch{3}.spm.util.exp_frames.files(1) = cfg_dep('File Selector (Batch Mode): Selected Files (s6_sub-PC001_ses-wave1_task-food_acq-1_bold_space-MNI152NLin2009cAsym_preproc.nii)', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{3}.spm.util.exp_frames.frames = Inf;
matlabbatch{4}.spm.util.exp_frames.files(1) = cfg_dep('File Selector (Batch Mode): Selected Files (s6_sub-PC001_ses-wave1_task-food_acq-2_bold_space-MNI152NLin2009cAsym_preproc.nii)', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{4}.spm.util.exp_frames.frames = Inf;
matlabbatch{5}.spm.stats.fmri_spec.dir = {'/projects/giuliani_lab/shared/PCSR/nonbids_data/fMRI/fx/models/food/condition/sub-PC001/'};
matlabbatch{5}.spm.stats.fmri_spec.timing.units = 'secs';
matlabbatch{5}.spm.stats.fmri_spec.timing.RT = 2;
matlabbatch{5}.spm.stats.fmri_spec.timing.fmri_t = 72;
matlabbatch{5}.spm.stats.fmri_spec.timing.fmri_t0 = 36;
matlabbatch{5}.spm.stats.fmri_spec.sess(1).scans(1) = cfg_dep('Expand image frames: Expanded filename list.', substruct('.','val', '{}',{3}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.stats.fmri_spec.sess(1).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{5}.spm.stats.fmri_spec.sess(1).multi = {'/projects/giuliani_lab/shared/PCSR/PCSR_scripts/fMRI/fx/multiconds/ROC/condition/PC001_ROC1.mat'};
matlabbatch{5}.spm.stats.fmri_spec.sess(1).regress = struct('name', {}, 'val', {});
matlabbatch{5}.spm.stats.fmri_spec.sess(1).multi_reg = {'/projects/giuliani_lab/shared/PCSR/PCSR_scripts/fMRI/fx/motion/auto-motion-fmriprep/rp_txt/rp_PC001_1_food_1.txt'};
matlabbatch{5}.spm.stats.fmri_spec.sess(1).hpf = 128;
matlabbatch{5}.spm.stats.fmri_spec.sess(2).scans(1) = cfg_dep('Expand image frames: Expanded filename list.', substruct('.','val', '{}',{4}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
matlabbatch{5}.spm.stats.fmri_spec.sess(2).cond = struct('name', {}, 'onset', {}, 'duration', {}, 'tmod', {}, 'pmod', {}, 'orth', {});
matlabbatch{5}.spm.stats.fmri_spec.sess(2).multi = {'/projects/giuliani_lab/shared/PCSR/PCSR_scripts/fMRI/fx/multiconds/ROC/condition/PC001_ROC2.mat'};
matlabbatch{5}.spm.stats.fmri_spec.sess(2).regress = struct('name', {}, 'val', {});
matlabbatch{5}.spm.stats.fmri_spec.sess(2).multi_reg = {'/projects/giuliani_lab/shared/PCSR/PCSR_scripts/fMRI/fx/motion/auto-motion-fmriprep/rp_txt/rp_PC001_1_food_2.txt'};
matlabbatch{5}.spm.stats.fmri_spec.sess(2).hpf = 128;
matlabbatch{5}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
matlabbatch{5}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
matlabbatch{5}.spm.stats.fmri_spec.volt = 1;
matlabbatch{5}.spm.stats.fmri_spec.global = 'None';
matlabbatch{5}.spm.stats.fmri_spec.mthresh = -Inf;
matlabbatch{5}.spm.stats.fmri_spec.mask = {'/projects/giuliani_lab/shared/spm12/canonical/MNI152_T1_1mm_brain_mask.nii,1'};
matlabbatch{5}.spm.stats.fmri_spec.cvi = 'FAST';
