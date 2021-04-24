%% RUN AFTER THE SCRIPT generateCoOc_RR_dists.mat

%% VARIABLES
nSymbols = 9; % CHANGE TO FIT NUMBER OF SYMBOLS!
wordN = 5;

L_NN = length(RR_NN);
L_PAF = length(RR_PAF);
L_TOTAL = L_NN + L_PAF;

COInputs1 = zeros(L_TOTAL,nSymbols^2);
COInputs2 = zeros(L_TOTAL,nSymbols^3);
COInputs3 = zeros(L_TOTAL,nSymbols^4);
COInputs4 = zeros(L_TOTAL,nSymbols^5);
% COInputs5 = zeros(L_TOTAL,nSymbols^6);
% COInputs6 = zeros(L_TOTAL,nSymbols^7);
% COInputs7 = zeros(L_TOTAL,nSymbols^8);



for i = 1:L_TOTAL
    if i < L_PAF + 1 
    for k = 1:nSymbols
        COInputs1(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,1}(k,:);
    end
    for k = 1:nSymbols^2
        COInputs2(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,2}(k,:);
    end
    for k = 1:nSymbols^3
        COInputs3(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,3}(k,:);
    end
    for k = 1:nSymbols^4
        COInputs4(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,4}(k,:);
    end
%     for k = 1:nSymbols^5
%         COInputs5(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,5}(k,:);
%     end
%     for k = 1:nSymbols^6
%         COInputs6(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,6}(k,:);
%     end
%     for k = 1:nSymbols^7
%         COInputs7(i, nSymbols*(k-1)+1:nSymbols*k) = COnn{i,7}(k,:);
%     end
    else
        %if i > L_PAF + 1
        %j = i + L_NN;
        j = i;      
        for k = 1:nSymbols
            COInputs1(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i-(L_PAF),1}(k,:);
        end
        for k = 1:nSymbols^2
            COInputs2(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i-(L_PAF),2}(k,:);
        end
        for k = 1:nSymbols^3
            COInputs3(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i-(L_PAF),3}(k,:);
        end
        for k = 1:nSymbols^4
            COInputs4(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i-(L_PAF),4}(k,:);
        end
%         for k = 1:nSymbols^5COInputs7
%             COInputs5(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i,5}(k,:);
%         end
%         for k = 1:nSymbols^6
%             COInputs6(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i,6}(k,:);
%         end
%         for k = 1:nSymbols^7
%             COInputs7(j, nSymbols*(k-1)+1:nSymbols*k) = COpafe{i,7}(k,:);
%         end
    end
end


csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL2.csv'),COInputs1);
csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL3.csv'),COInputs2);
csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL4.csv'),COInputs3);
csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL5.csv'),COInputs4);
% csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL6.csv'),COInputs5);
% csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL7.csv'),COInputs6);
% csvwrite(strcat('aftdp_afpdb_', num2str(nSymbols), 'sym_wordL8.csv'),COInputs7);
