% ENIGMA MRS SHORT-TE JOB FILE
% Georg Oeltzschner, JHU 2024-2025

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 0. SETUP - DO NOT EDIT %%%

% Determine location of this file, basis sets, and control file 
% Get the path of this test function
[enigmaPath,~,~] = fileparts(mfilename('fullpath'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 1. SPECIFY SEQUENCE INFORMATION %%%

% Specify sequence type
seqType         = 'unedited';

% Specify editing targets
editTarget      = {'none'};

% Specify data scenario
dataScenario    = 'invivo';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 2. SPECIFY DATA HANDLING AND MODELING OPTIONS %%%

% Specify spectral registration method 
opts.SpecReg                = 'RobSpecReg';

% Specify whether eddy-current correction needs to be performed
opts.ECC.raw                = 1;

% Save processed spectra in vendor-specific format (SDAT/SPAR, RDA, P)?
opts.saveVendor             = 0;
                                                
% Save LCModel-exportable files for each spectrum?
opts.saveLCM                = 1;
                                                
% Save jMRUI-exportable files for each spectrum?
opts.saveJMRUI              = 0;
                                                                                                
% Save processed spectra in NIfTI-MRS format?
opts.saveNII                = 0;
                                                
% Save PDF output for all Osprey modules and subjects?
opts.savePDF                = 1;

% Save mat file of the compiled fitting parameters?
opts.exportParams.flag      = 0;
opts.exportParams.path      = '';

% Choose the fitting algorithm
opts.fit.method             = 'LCModel';

%%% ----- LCMODEL FITTING OPTIONS -----
% Specify LCModel-format basis set (.BASIS)
% If no basis set file is provided Osprey will generate the .BASIS file
% from Osprey's database
%
% Uncommenet the basis set most appropriate for your data:
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_GE_PRESS_Product_TE35.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Philips_PRESS_Product_TE30.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Philips_PRESS_Product_TE31.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Philips_PRESS_Product_TE32.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Philips_PRESS_Product_TE35.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Philips_PRESS_Product_TE36.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Philips_PRESS_Product_TE45.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Siemens_PRESS_Product_TE30.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Siemens_PRESS_Product_TE32.BASIS');
% opts.fit.basisSetFile       = fullfile(enigmaPath, 'basisLibrary', '3T_Siemens_PRESS_Product_TE35.BASIS');

% Specify LCModel-type control file (.CONTROL)
% This is optional: If you leave this field blank, Osprey will create a
% minimum control file for you.
opts.fit.controlFile         = fullfile(enigmaPath, 'controlTemplateENIGMA.control');

% Specify custom LCModel binary path
% You can set the path to a custom-compiled LCModel binary here. If left
% empty, Osprey will try to use one of the pre-compiled binaries it is
% shipped with.
% opts.fit.customLCModelBinary = '';
%%% ----- END LCMODEL FITTING OPTIONS -----

% Optional: Deface the structural images in the Coreg/Seg figures for HIPAA
% compliance 
opts.img.deface             = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 3. SPECIFY MRS DATA AND STRUCTURAL IMAGING FILES %%

% Clear existing files
clear files files_ref files_w files_nii files_mm

% Specify metabolite data
% (MANDATORY)
files   = {'C:\data\sub-01\ses-01\mrs\sub-01_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-02\ses-01\mrs\sub-02_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-03\ses-01\mrs\sub-03_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-04\ses-01\mrs\sub-04_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-05\ses-01\mrs\sub-05_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-06\ses-01\mrs\sub-06_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-07\ses-01\mrs\sub-07_ses-01_acq-press_svs.nii', ...
	       'C:\data\sub-08\ses-01\mrs\sub-08_ses-01_acq-press_svs.nii', ...
	      };              


% Specify water reference data for eddy-current correction (same sequence as metabolite data!)
% (OPTIONAL)
files_ref = {'C:\data\sub-01\ses-01\mrs\sub-01_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-02\ses-01\mrs\sub-02_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-03\ses-01\mrs\sub-03_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-04\ses-01\mrs\sub-04_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-05\ses-01\mrs\sub-05_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-06\ses-01\mrs\sub-06_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-07\ses-01\mrs\sub-07_ses-01_acq-pressecc_mrsref.nii', ...
             'C:\data\sub-08\ses-01\mrs\sub-08_ses-01_acq-pressecc_mrsref.nii', ...
             };              


% Specify water data for quantification (e.g. short-TE water scan)
% (OPTIONAL)
files_w   = {'C:\data\sub-01\ses-01\mrs\sub-01_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-02\ses-01\mrs\sub-02_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-03\ses-01\mrs\sub-03_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-04\ses-01\mrs\sub-04_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-05\ses-01\mrs\sub-05_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-06\ses-01\mrs\sub-06_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-07\ses-01\mrs\sub-07_ses-01_acq-press-conc_mrsref.nii', ...
             'C:\data\sub-08\ses-01\mrs\sub-08_ses-01_acq-press-conc_mrsref.nii', ...
             };              


% Specify T1-weighted structural imaging data
% (OPTIONAL)
files_nii = {'C:\data\sub-01\ses-01\anat\sub-01_ses-01_T1w.nii', ...
             'C:\data\sub-02\ses-01\anat\sub-02_ses-01_T1w.nii', ...
             'C:\data\sub-03\ses-01\anat\sub-03_ses-01_T1w.nii', ...
             'C:\data\sub-04\ses-01\anat\sub-04_ses-01_T1w.nii', ...
             'C:\data\sub-05\ses-01\anat\sub-05_ses-01_T1w.nii', ...
             'C:\data\sub-06\ses-01\anat\sub-06_ses-01_T1w.nii', ...
             'C:\data\sub-07\ses-01\anat\sub-07_ses-01_T1w.nii', ...
             'C:\data\sub-08\ses-01\anat\sub-08_ses-01_T1w.nii', ...
            };


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 4. SPECIFY STAT FILE %%%

% Supply location of a csv file, which contains possible correlation
% measures and group variables. Each column must start with the name of the
% measure. For the grouping variable use 'group' and numbers between 1 and
% the number of included groups. If no group is supplied the data will be
% treated as one group. (You can always use the direct path)

% file_stat = fullfile(enigmaPath, 'stat.csv');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% 5. SPECIFY OUTPUT FOLDER %%

% The Osprey data container will be saved as a *.mat file in the output
% folder that you specify below. In addition, any exported files (for use
% with jMRUI, TARQUIN, or LCModel) will be saved in sub-folders.

% Specify output folder (you can always use the direct path)
% (MANDATORY)
outputFolder = fullfile(enigmaPath, 'derivatives');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
