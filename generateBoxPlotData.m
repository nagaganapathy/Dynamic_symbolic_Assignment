 %% CHANGE THE FILE NAME!
A = csvread('sym_wrd-3\aftdp_afpdb_3sym_wordL3.csv');


maxOfCoOcMatrix = zeros(length(A(:,1)), 1); 

for i = 1:length(A(:,1))
    maxOfCoOcMatrix(i) = max(A(i,:)); 
end

label = [repmat({"SR"}, 55, 1); repmat({"AF"}, 55, 1)]; 
boxplot(maxOfCoOcMatrix, label); 

T = table(maxOfCoOcMatrix, label); 

writetable(T, 'Boxblot_3sym_L2.csv');
    