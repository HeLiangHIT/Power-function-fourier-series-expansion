
%% 初始化参数
clear,clc,close all;
N=100;%区间点数
M=3;%重复周期
M=2*M-1;%必须是奇数否则会导致时间轴偏移
K=100;%拟合精度

%% f = theta 函数
% func=@(x)x;%函数指定
% a0=0;
% funca=@(n)(n*0);%cos(nt)的系数
% funcb=@(n)(2*(-1).^(n+1)./n);%sin(nt)的系数

%% f = theta^2函数
func=@(x)x.^2;%函数指定
a0=pi.^2/3;
funca=@(n)(4*(-1).^(n)./n.^2);%cos(nt)的系数
funcb=@(n)(n*0);%sin(nt)的系数

%% f = theta^3 函数
% func=@(x)x.^3;%函数指定
% a0=0;
% funca=@(n)(n*0);%cos(nt)的系数
% funcb=@(n)(12*(-1).^(n)./n.^3 - 2*pi^2*(-1).^(n)./n);%sin(nt)的系数

%% f = theta^4 函数
% func=@(x)x.^4;%函数指定
% a0=pi^4/5;
% funca=@(n)(8*pi^2*(-1).^(n)./n.^2 - 48*(-1).^(n)./n.^4);%cos(nt)的系数
% funcb=@(n)(n*0);%sin(nt)的系数

%% 数据产生
t_period=linspace(-pi,pi,N);
x_period=func(t_period);%一周期数据
t=linspace(-pi*M,pi*M,N*M);%为什么会有偏移呢
x=repmat(x_period,1,M);%信号
coefa=funca(1:K);%系数
coefb=funcb(1:K);
y=Fourier_expand(t,a0,coefa,coefb);
% figure('Position',[50,50,800,400]);
% stem(coefa,'p'),hold on; stem(coefb,'o');legend('cosn\theta系数','sinn\theta系数');title('分解系数');
figure('Position',[50,50,800,400]);subplot(3,1,[1,2]);
plot(t,x,'k.-',t,y,'ro-'); axis tight; legend('原始信号','级数拟合');title(['展开级数=',num2str(K)]);
subplot(3,1,3);plot(t,x-y,'r.-'); axis tight; title('截断误差');


% uimenufcn(gcf, 'EditCopyFigure')%绝招，和copy复制的一样
% print -dmeta%自动复制矢量图形，用 print -dbitmap复制位图
print -dbitmap