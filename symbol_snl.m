function sym = symbol_snl(RRdist, numsym)

    if(numsym == 8) 
        sym = symbol_ben(RRdist); %fixed values
    else 

        mean_dist = mean(RRdist);

        % discretization for RR-intervals with varying values

        sym = zeros(1,length(RRdist));
        if numsym == 2
            for i = 1:length(sym)
                if RRdist(i) < mean_dist
                    sym(i) = 1;
                else
                    sym(i) = 2;
                end
            end
        end
        if numsym == 3
            for i = 1:length(sym)
                if RRdist(i) < 0.95*mean_dist
                    sym(i) = 1;
                else 
                    if RRdist(i) > 1.05*mean_dist
                        sym(i) = 3;
                    else
                        sym(i) = 2;
                    end
                end
            end
        end
        if numsym == 5
            for i = 1:length(sym)
                if RRdist(i) < 0.90*mean_dist
                    sym(i) = 1;
                else 
                    if RRdist(i) < 0.95*mean_dist
                        sym(i) = 2;
                    else
                        if RRdist(i) > 1.1*mean_dist
                            sym(i) = 5;
                        else
                            if RRdist(i) > 1.05*mean_dist
                                sym(i) = 4;
                            else
                                sym(i) = 3;
                            end
                        end
                    end
                end
            end
        end
        if numsym == 7
            for i = 1:length(sym)
                if RRdist(i) < 0.85*mean_dist
                    sym(i) = 1;
                else 
                    if RRdist(i) < 0.90*mean_dist
                        sym(i) = 2;
                    else
                        if RRdist(i) < 0.95*mean_dist
                            sym(i) = 3;
                        else
                            if RRdist(i) > 1.05*mean_dist
                                sym(i) = 7;
                            else
                                if RRdist(i) > 1.10*mean_dist
                                    sym(i) = 6;
                                else
                                    if RRdist(i) > 1.15*mean_dist
                                        sym(i) = 5;
                                    else
                                        sym(i) = 4;
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        
        if numsym == 9
            for i = 1:length(sym)
               if RRdist(i) < 0.80*mean_dist
                    sym(i) = 1;
                else 
                if RRdist(i) < 0.85*mean_dist
                    sym(i) = 2;
                else 
                    if RRdist(i) < 0.90*mean_dist
                        sym(i) = 3;
                    else
                        if RRdist(i) < 0.95*mean_dist
                            sym(i) = 4;
                        else
                            if RRdist(i) > 1.05*mean_dist
                                sym(i) = 9;
                            else
                                if RRdist(i) > 1.10*mean_dist
                                    sym(i) = 8;
                                else
                                    if RRdist(i) > 1.15*mean_dist
                                        sym(i) = 7;
                                    else
                                        if RRdist(i) > 1.20*mean_dist
                                            sym(i) = 6;
                                        else
                                            sym(i) = 5;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
               end
            end
        end

    end
end

