function [x,k,res]=Broyden(x0, eps)
% Broyden法
% 初始迭代向量：x0
% 迭代精度：eps
% 解向量：x
% 迭代次数：k
n = length(x0);
x = x0;
k = 0;
Fk = fun(x);
%B = dfun(x);%B0的选取有很大的影响
B = eps^(-0.5)*n^(0.25)*eye(n);
r = norm(Fk);
res = [];
res = [res r];
while r > eps
    s = linsolve(B,-Fk);%s=dk
    if norm(s)<= eps/10
        disp('Broyden：Change in X too small.');
        return;
    end
    x = x+s;
    y = -Fk;
    Fk = fun(x);
    y = y+Fk;
    B = B+(y-B*s)*(y-B*s)'/((y-B*s)'*s);%rank1
    %B = B-(B*s*s'*B)/(s'*B*s)+y*y'/(y'*s);%rank2:BFGS
    %B = B+((y-B*s)*y'+y*(y-B*s)')/(y'*s)-(((y-B*s)'*s)/(y'*s)^2)*y*y';%rank2:DFP
    k=k+1;
    if(k > 1000)
        disp('Broyden：Too many function iterations.');
        return;
    end
    r = norm(Fk);
    res = [res r];
end
disp('Broyden converged to a root!');
end