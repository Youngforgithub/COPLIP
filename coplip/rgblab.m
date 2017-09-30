function re=rgblab(pic_in,inverse)
 
%%%--------------------constants----------------------
lms=[0.3811 0.5783 0.0402,
     0.1967 0.7244 0.0782,
     0.0241 0.1288 0.8444];   %变换矩阵
lab1=[1/sqrt(3)      0         0,
          0     1/sqrt(6)      0,
          0          0     1/sqrt(2)];
lab2=[1  1  1,
      1  1 -2,
      1 -1  0];
r_lms=[4.4679 -3.5873 0.1193,
      -1.2186 2.3809 -0.1624,
       0.0497 -0.2439 1.2045];  %逆变换矩阵
 
temp_rgb=zeros(3,1);
temp_lab=temp_rgb;
temp_lms=temp_rgb;
[m n l]=size(pic_in);
pic_in=double(pic_in);
pic_out=pic_in;
%%%--------------------transform----------------------
if inverse==0    % from rgb to lab 正变换
    for i=1:m
        for j=1:n
            temp_rgb(1:3,1)=pic_in(i,j,1:3);
            temp_lms=lms*temp_rgb;
            temp_lms=log(temp_lms);
            temp_lab=lab1*lab2*temp_lms;
            pic_out(i,j,1:3)=temp_lab(1:3,1);
        end
    end
end
 
if inverse==1    % from lab to rgb 反变换
    for i=1:m
        for j=1:n
            temp_lab(1:3,1)=pic_in(i,j,1:3);
            temp_lms=(lab2')*lab1*temp_lab;
            temp_lms=exp(temp_lms);
            temp_rgb=r_lms*temp_lms;
            pic_out(i,j,1:3)=temp_rgb(1:3,1);
        end
    end
end
re=pic_out;