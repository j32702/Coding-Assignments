%% regular image
clc;
clear all;
img=imread('butterfly.gif');
img = double(img)/250;
size(img)
pic = zeros(512,512);
%3:3:512
for y = 1:512
    for x = 1:512
if ((x < 1) || (y > 512))
    pic(x, y) = 0;
elseif (x-1 < 1 || y-1 < 1)
        pic(x, y) = 0;
elseif (x - 1 < 1 || y > 512)
        pic(x, y) = 0;
elseif (x - 1 < 1 || y+1 > 512)
        pic(x, y) = 0;
elseif (x < 1 || y-1 < 1)
        pic(x, y) = 0;
elseif (x < 1 || y+1 > 512)
        pic(x, y) = 0;
elseif (x+1 > 512 || y-1 < 1)
        pic(x, y) = 0;
elseif (x+1 > 512 || y > 512)
        pic(x, y) = 0;
elseif (x+1 > 512 || y+1 > 512)
        pic(x, y) = 0;
else
    pic(x, y) = img(x-1,y-1) + img(x,y-1) + img(x+1,y-1) + img(x-1,y) + img(x,y) + img(x+1,y) + img(x-1,y+1) + img(x,y+1) + img(x+1,y+1);
    pic(x, y) = pic(x,y)/9;



end
    end
end
imshow(img);
figure(2);
imshow(pic);