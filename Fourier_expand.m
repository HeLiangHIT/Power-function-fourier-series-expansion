function y=Fourier_expand(t,a0,coefa,coefb)
%���������a0,coefa,coefbչ������,��ͼ������Ϊt

N=length(coefa);%չ����ȷ���ļ���
a=a0*ones(1,length(t));%ֱ������
b=zeros(1,length(t));
for n=1:N
    a=a+coefa(n)*cos(n*t);%cosntϵ���ۼ�
    b=b+coefb(n)*sin(n*t);%sinntϵ���ۼ�
end

y=a+b;%����ۼӺ�

end