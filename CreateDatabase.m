% Includes submenue which will use create sub menue of respective system
% Create database of images which might be Camera Images or stored one

function []=CreateDatabase
cd TrainDatabase;   % changing directory (cd)
while (1==1)
    choice=menu('Create Database',...
                 ' Add  an  Image',...
                  ' Add  a  Folder',...
                  ' Exit');
    if (choice ==1)
        addimage;   % addimage function exits in TrainDatabase Directory
    end
    if (choice == 2)
        addfolder;
    end
    if (choice == 3)
        cd ..;      % Go to previous directory
        clc;
        close all;
        return;
    end    
end
end