clear all;clc
Lena=imread('lena.bmp');
Rlena=rgb2gray(Lena);
f=tofloat(Rlena);
%转化RGB to LMS
lms=[ 0.3811 0.5783 0.0402
0.1967 0.7244 0.0782
0.0241 0.1288 0.8444];
L=0.3811.*Lena(:,:,1);+0.5783.*Lena(:,:,2)+0.0402*Lena(:,:,3);
M=0.1967.*Lena(:,:,1)+0.7244.*Lena(:,:,2)+0.0782.*Lena(:,:,3);
S=0.0241.*Lena(:,:,1)+0.1288.*Lena(:,:,2)+0.8444.*Lena(:,:,3);
LMS(:,:,1)=L;
LMS(:,:,2)=M;
LMS(:,:,3)=S;
%LMS 的彩色空间分量L、M、S转化为l、m、s分量
l_ms=255-LMS;
a=im2double(255)-(im2double(L)).^(40/61).*(im2double(M)).^(20/61).*(im2double(S)).^(1/61);
figure,imshow(a);