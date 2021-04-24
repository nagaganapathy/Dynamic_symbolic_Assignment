function show_heatmaps(CO, title)
    [~, y] = size(CO);
    x = 25;
    for i = 1:y
        f = figure(... 
                'PaperType','a4letter', 'PaperOrientation','Portrait',... 
                'PaperUnits','centimeters', ... 
                'PaperPosition',[0.63 0.63 19.72 28.41],...     
                'PaperSize',[20.98 29.68]);
        p = uipanel('Parent',f,'BorderType','none'); 
        p.Title = horzcat(title, int2str(i)); 
        p.TitlePosition = 'centertop'; 
        p.FontSize = 12;
        p.FontWeight = 'bold';
        
        for j = 1:x
            subplot(5,5,j, 'Parent', p);
            heatmap(CO{j,i});
        end
        filename = strcat('Heatmaps', title, int2str(i))
        print(filename,'-dpng')

    end
end