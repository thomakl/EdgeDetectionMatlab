%function [C]= ecrireCoords(coord_x,coord_y)
    
    x= 0;
    y = 1;
    
    %On ouvre un fichier ou le créé
    file = fopen('test.txt','w');

    %écrit dans ce fichier, file est sa reference pour matlab
        
    fprintf(file,'%s\n','n) x=');
    fprintf(file,'%i\t %i\t %i\n',x);
    fprintf(file,'%s\n','y=');
    fprintf(file,'%i\t %i\t %i\n',y);

    %On ferme le fichier, pour pouvoir le lire après.
    fclose(file);
%end