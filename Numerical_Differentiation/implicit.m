function df=implicit(f,x0,h,N)
%����ʽ����x0��������2N+1�����΢�֣�Ĭ������Ϊ��֪
n=2*N+1;
F=zeros(n,1);
x1=x0-N*h;
for i=1:n
    F(i)=f(x1+i*h)-f(x1+(i-2)*h);
end
F=F/(2*h);
%����֪�㵼��
syms x,y=f(x);
dfun=diff(y);
F(1)=F(1)-subs(dfun,x,x1)/6;
F(n)=F(n)-subs(dfun,x,x0+N*h)/6;
%׷�Ϸ�������Խ�ϵ����������Է�����
M=crout(2*ones(1,n)/3,ones(1,n-1)/6,ones(1,n-1)/6,F);
df=M(N+1);
end