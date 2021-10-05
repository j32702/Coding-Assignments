%% regular image
clc;
clear all;

% Read an image
img=imread('butterfly.gif');
% By default, all MATLAB variables you created are double.
% However, you have to pay attention to data types when youread data from a file
% .gif files are stored as uint8 (unsigned 8bit integer, 0means black and 255 means white)
% Convert to [0,1]
img = double(img)/255;
% Show it, any value larger than 1 will be displayed as white, any value lower than 0 will be displayed as black
imshow(img);
size(img)
%% brighter image
clc;
clear all;

img=imread('butterfly.gif');
img = double(img)/127.5;
imshow(img);
%% darker image
clc;
clear all;

img=imread('butterfly.gif');
img = double(img)/382.5;
% img = img/2.5;
imshow(img);
%% increased contrast image
clc;
clear all;

img=imread('butterfly.gif');
img = double(img)/255;
img=img*5;
img=img-1.9;
    
imshow(img);
%% decreased contrast image
clc;
clear all;

img=imread('butterfly.gif');
img = double(img)/255;
for n = 1:(512*512)
    if img(n)<0.15
        img(n)=img(n)*4;
    end
    if 0.15<img(n)<0.2
        img(n)=img(n)*3;
    end
    if 0.2<img(n)<0.3
        img(n)=img(n)*2;
    end
    if 0.3<img(n)<0.4
        img(n)=img(n)*1.5;
    end
    if 0.6<img(n)<0.7
        img(n)=img(n)*0.8;
    end
    if img(n)>0.7
        img(n)=img(n)/1.5;
    end
end
imshow(img);