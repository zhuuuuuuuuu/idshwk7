evalin('base','clear');
I = imread('test.jpg'); %读取test图片（为三通道彩色图片） 
image0 = rgb2gray(I);%%%将RGB图片转换为灰度图片
image=image0;
fid=fopen('test.txt','r');
keyBin=fread(fid,'ubit1');
[m,n]=size(image);
[x,y]=size(keyBin);
if x*y>m*n
  error('嵌入信息量过大，请重新选择图像');
end
len_total=x*y;
rng(1,'twister');
row=randi(m,1,len_total);
col=randi(n,1,len_total);
%在LSB隐藏信息
i=1;
for a=1:x
    for b=1:y
        image(row(i),col(i))=image(row(i),col(i))-mod(image(row(i),col(i)),2)+keyBin(a,b);%在选取像素点二进制表示的最后一位进行修改
        i=i+1;
    end
    if a==x && b==y &&i==len_total+1
        break;
    end
end
image=uint8(image);
imwrite(image,'test.png');
%显示实验结果
subplot(1,2,1);imshow(image0);title('原始图像');
subplot(1,2,2);imshow(image);title('隐藏信息的图像');




