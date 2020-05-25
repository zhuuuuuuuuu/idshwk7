evalin('base','clear');
len_total=144;
cover = imread('test.png');
[m,n]=size(cover);
fopen('get0.txt','w');
frr=fopen('get0.txt','a+');
rng(1,'twister');
row=randi(m,1,len_total);
col=randi(n,1,len_total);
p=1;
a=1;
b=0;
for i=1:len_total
    mod(cover(row(i),col(i)),2)
    if mod(cover(row(i),col(i)),2)==1
        fwrite(frr,a,'ubit1');
    else 
        fwrite(frr,b,'ubit1');
    end
    if p==len_total
        break;
    end
    p=p+1;
end
fclose(frr);
