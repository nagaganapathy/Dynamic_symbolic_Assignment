function PTP = getPTP_snl(sym,n,numsym)

if numsym == 2
    abcde = [1,2];
else 
    if numsym == 3
        abcde = [1,2,3];
    else 
        if numsym == 5
            abcde = [1,2,3,4,5];
        else 
            if numsym == 7
                abcde = [1,2,3,4,5,6,7];
            else
                abcde = [1,2,3,4,5,6,7,8,9];
            end
        end
    end
end
pos_patterns = permn(abcde,n); %function (c) Jos van der Geest
%  calculate PTF and PTP

pos = length(pos_patterns);
PTF = zeros(pos,numsym);

for i=1:length(sym)-(n +1)
    current = sym(i:i+n-1); % chain of symbols length n
    index = my_ismember(pos_patterns,current); %line of PTF 
    let = sym(i+n); % n+1st signal
    if let == 1 %column of PTF
        PTF(index,1) = PTF(index,1)+1;
    end
    if let == 2
        PTF(index,2) = PTF(index,2)+1;
    end
    if let == 3
        PTF(index,3) = PTF(index,3)+1;
    end
    if let == 4
        PTF(index,4) = PTF(index,4)+1;
    end
    if let == 5
        PTF(index,5) = PTF(index,5)+1;
    end
    if let == 6
        PTF(index,6) = PTF(index,6)+1;
    end
    if let == 7
        PTF(index,7) = PTF(index,7)+1; 
    end
    if let == 8
        PTF(index,8) = PTF(index,8)+1;
    end
    if let == 9
        PTF(index,9) = PTF(index,9)+1;
    end
end

clear pos_patterns;
s = sum(sum(PTF));
if s > 0
    for i=1:length(PTF(:,1))
        for j = 1:length(PTF(i,:))
            PTF(i,j)=PTF(i,j) / s;
        end
    end
end
PTP = PTF;