function x=crout(a,c,d,b)
%追赶法
%数组a存储三角矩阵A的主对角线元素，c、d存储主对角线上边下边带宽为1的元素
n=length(a);
n1=length(c);
n2=length(d);

%参数检查
if (n1~=n2)||(n~=n1+1)
    error('MATLAB:Crout:矩阵维数不匹配');
end

%初始化
p=1:n;
q=1:n-1;
x=1:n;
y=1:n;

%追赶法程序主体
p(1)=a(1);
for i=1:n-1
    q(i)=c(i)/p(i);
    p(i+1)=a(i+1)-d(i)*q(i);
end
%正解y
y(1)=b(1)/p(1);
for i=2:n
    y(i)=(b(i)-d(i-1)*y(i-1))/p(i);
end
%倒解x
x(n)=y(n);
for i=(n-1):-1:1
    x(i)=y(i)-q(i)*x(i+1);
end
end