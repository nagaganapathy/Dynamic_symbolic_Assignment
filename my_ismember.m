function x = my_ismember(a,b)
% finds a chain of symbols a in b matrice a
% a     - matrice with lines of length(a) and symbols
% b     - chain of symbols

x = 0;
stop = false;
for i=1:length(a)
    stop = true;
    for j = 1:length(b)
        if a(i,j) ~= b(j) 
            stop = false; %if row doesn't equal b, look at next row
            break;
        end
    end
    if stop == true
        x = i;
        break;
    end
end

if x == 0 
    error = horzcat("Something went wrong, x is 0!", "a:", num2str(b))
end