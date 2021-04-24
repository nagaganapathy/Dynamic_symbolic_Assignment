function sym = symbol_ben(RRdist)

% discretization for RR-intervals with fixed values 

sym = zeros(1,length(RRdist));


for i = 1:length(sym)
    if RRdist(i) > 1.5
        sym(i) = 8;
    else 
        if RRdist(i) > 1.2
            sym(i) = 7;
        else
            if RRdist(i) > 1.05
                sym(i) = 6;
            else 
                if RRdist(i) > 0.9
                    sym(i) = 5;
                else 
                    if RRdist(i) > 0.75
                        sym(i) = 4;
                    else 
                        if RRdist(i) > 0.6
                            sym(i) = 3;
                        else 
                            if RRdist(i) > 0.3
                                sym(i) = 2;
                            else
                                sym(i) = 1;
                            end
                        end
                    end
                end
            end
        end
    end
end
                    
end

