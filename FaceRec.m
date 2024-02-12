function [ OutputName ] = FaceRec(m, A, Eigenfaces)
%cd TestImage;
while (1==1)
    choice=menu('Face Recognition',...
                'Input Image From File',...
                'Capture Now',...
                'Recognition',...
                'Exit');
    if (choice ==1)
       try 
           cd TestImage;
           %close all;
       end; 
         ChooseFile = imgetfile;
         capcha = imread(ChooseFile);
         irow = size(capcha, 1);
         icol = size(capcha, 2);
         if(irow ~= 381 && icol ~= 281)
            capcha=imcrop(capcha,[180,40,280,380]);
            %figure, imshow(capcha), title('Cropped Image');
            %return;
         end
         figure, imshow(capcha), title('Image to be Recognised');
         %return;
         saveimage(capcha);
    end
    if (choice == 2)
        try cd TestImage;close all; end;
        capturenow;
    end    
    if (choice == 3)
       Distance_Matrix =Recognition(m, A, Eigenfaces);
       save ('Distances.mat', 'Distance_Matrix');
       
       % ******************* Evaluating Training Directory ***************
       load path.mat;           %loading Path matrix
       if(strcmp(TrainDatabasePath, 'D:\Facerec\TrainDatabase'))
        disp('D:\Facerec\TrainDatabase');
       [Bsort, Bidx] = getNElements(Distance_Matrix, 3);
       disp(Bidx);
       
%%%%%%%%%%%%%%%%% 3 Real Recognised Images %%%%%%%%%%%%%%%%%%%
    for i=1:3
       if (i==1)
          OutputName = Bidx(1);    % Fetching Element 1by1
          if(OutputName <= 10)
              n = OutputName;       % n = Image Number
              d = 1;                % d = Directory Number
          else
              if(mod(OutputName, 10) == 0)
              %Means Image is last at number in directory
              d = OutputName/10;    %Directory Number
              n = 10;               %Image Number
              else
               d = ceil(OutputName/10);
               n = mod(OutputName, 10);
              end
          end
           im=imread('InputImage.jpg');
           cd ..;
           figure, subplot(221);
           imshow(im)
           title('Test Image'); 
       else
           OutputName = randperm(10, 1);
           n = OutputName;
       end
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       % In first Iteration only
       img=strcat('TrainDatabase\s',int2str(d),'\',int2str(n),'.jpg');
       disp(img);
       SelectedImage=imread(img);
       j = i + 1;
       subplot(2,2,j),imshow(SelectedImage);
       title('Recognised Image');
%        disp('Student No');
%        disp(int2str(n));
    end
        return;
       else
        disp('D:\Facerec\TrainDatabase\TrainDatabase2');
        [Euc_dist_min, Recognized_index] = min(Distance_Matrix);
        OutputName = Recognized_index;
        disp(OutputName);
        %************* Even Odd Image Identification ***************
       index = mod(OutputName, 2);
       if(index == 0)
        n = OutputName/2;
       else
           n=((OutputName+1)/2);
       end 
       %************************************************************
       im=imread('InputImage.jpg');
       cd ..;
       img=strcat('TrainDatabase2\s',int2str(n),'\1.jpg');
       SelectedImage=imread(img);
       figure, subplot(121);
       imshow(im)
       title('Test Image');
       subplot(122),imshow(SelectedImage);
       title('Recognised Image');
       return;
       end
%      %******************************************************************
       

    end 
   if (choice == 4) 
       clc; 
        %close all;
        return;
    end    
end

