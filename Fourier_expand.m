function y=Fourier_expand(t,a0,coefa,coefb)
%根据输入的a0,coefa,coefb展开函数,绘图横坐标为t

N=length(coefa);%展开精确到的级数
a=a0*ones(1,length(t));%直流分量
b=zeros(1,length(t));
for n=1:N
    a=a+coefa(n)*cos(n*t);%cosnt系数累加
    b=b+coefb(n)*sin(n*t);%sinnt系数累加
end

y=a+b;%输出累加和

end