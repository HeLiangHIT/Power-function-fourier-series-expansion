
%% ��ʼ������
clear,clc,close all;
N=100;%�������
M=3;%�ظ�����
M=2*M-1;%��������������ᵼ��ʱ����ƫ��
K=100;%��Ͼ���

%% f = theta ����
% func=@(x)x;%����ָ��
% a0=0;
% funca=@(n)(n*0);%cos(nt)��ϵ��
% funcb=@(n)(2*(-1).^(n+1)./n);%sin(nt)��ϵ��

%% f = theta^2����
func=@(x)x.^2;%����ָ��
a0=pi.^2/3;
funca=@(n)(4*(-1).^(n)./n.^2);%cos(nt)��ϵ��
funcb=@(n)(n*0);%sin(nt)��ϵ��

%% f = theta^3 ����
% func=@(x)x.^3;%����ָ��
% a0=0;
% funca=@(n)(n*0);%cos(nt)��ϵ��
% funcb=@(n)(12*(-1).^(n)./n.^3 - 2*pi^2*(-1).^(n)./n);%sin(nt)��ϵ��

%% f = theta^4 ����
% func=@(x)x.^4;%����ָ��
% a0=pi^4/5;
% funca=@(n)(8*pi^2*(-1).^(n)./n.^2 - 48*(-1).^(n)./n.^4);%cos(nt)��ϵ��
% funcb=@(n)(n*0);%sin(nt)��ϵ��

%% ���ݲ���
t_period=linspace(-pi,pi,N);
x_period=func(t_period);%һ��������
t=linspace(-pi*M,pi*M,N*M);%Ϊʲô����ƫ����
x=repmat(x_period,1,M);%�ź�
coefa=funca(1:K);%ϵ��
coefb=funcb(1:K);
y=Fourier_expand(t,a0,coefa,coefb);
% figure('Position',[50,50,800,400]);
% stem(coefa,'p'),hold on; stem(coefb,'o');legend('cosn\thetaϵ��','sinn\thetaϵ��');title('�ֽ�ϵ��');
figure('Position',[50,50,800,400]);subplot(3,1,[1,2]);
plot(t,x,'k.-',t,y,'ro-'); axis tight; legend('ԭʼ�ź�','�������');title(['չ������=',num2str(K)]);
subplot(3,1,3);plot(t,x-y,'r.-'); axis tight; title('�ض����');


% uimenufcn(gcf, 'EditCopyFigure')%���У���copy���Ƶ�һ��
% print -dmeta%�Զ�����ʸ��ͼ�Σ��� print -dbitmap����λͼ
print -dbitmap