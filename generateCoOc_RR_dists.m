%% FIRST OPEN DATA FILE
load('dataFile.mat')

%% PARAMETERS
%**************************************************

% CHANGE THESE ---------
NUM_OF_SYMBOLS = 9; % choose to be 2,3,5,7, or 8
MAX_N = 5; % Co-occurence matrices up to this number - WORDLENGTH
% ----------------------


% Tn = 0.2;       % threshold for SI (sparsity index)
STEPSIZE = 1;   % Sampling 
READ_FILES = 1;

RR_NN = training_nn;
RR_PAF = training_paf;

L_NN = length(RR_NN);
L_PAF = length(RR_PAF); 
% **************************************************

%% Get the Data
if READ_FILES == 1
    nn = cell(L_NN,1);
    pafe = cell(L_PAF,1);
%    pafn = cell(L_PAFN,1);
    
    COnn = cell(L_NN,MAX_N);
    COpafe = cell(L_PAF,MAX_N);
%    COpafn = cell(L_PAFN,MAX_N);

    for i = 1:L_NN
        nn{i}= symbol_snl(RR_NN{i}/128,NUM_OF_SYMBOLS);
        if i < L_PAF+1
             pafe{i} = symbol_snl(RR_PAF{i}/128, NUM_OF_SYMBOLS);
        end
%        if i < L_PAFN+1
%            pafn{i} = symbol_snl(RR_PAFN{i});
%        end
    end
end

%% Generate CoOcs

for k = 1:MAX_N
    for i = 1:L_NN
        COnn{i,k} = getPTP_snl(nn{i},k,NUM_OF_SYMBOLS);
    end
    for j = 1:L_PAF
        COpafe{j,k} = getPTP_snl(pafe{j},k,NUM_OF_SYMBOLS);
    end
end

%% Calculate and Save HeatMaps
% show_heatmaps(COnn,'NN');
% show_heatmaps(COpafe,'PAF');
