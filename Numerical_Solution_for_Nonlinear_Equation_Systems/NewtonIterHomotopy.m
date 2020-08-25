function [x,k,res]=NewtonIterHomotopy(x0,eps,N)
% 牛顿同伦法
% 初始迭代向量：x0
% 迭代精度：eps
% 解向量：x
% 迭代次数：k

%k = 0;
F0 = fun(x0);
x = x0; %x1=x0
k = 1;
F = fun(x);
b = F + (k/N-1)*F0;
r = norm(F);
res = [];
res = [res r r];%k=0由于没有变化被省掉了
while r > eps
    A = dfun(x);
    deta = linsolve(A,-b);
    x = x+deta;
    if norm(deta)<= eps/10
        disp('NewtonIterHomotopy： Change in X too small.');
        return;
    end
    k = k + 1;
    F = fun(x);
    if k < N
        b = F+(k/N-1)*F0;% 同伦过程
    else
        b = F;
    end
    if(k > 1000)
        disp('NewtonIterHomotopy：Too many function iterations.');
        return;
    end
    r = norm(F);
    res = [res r];
end
disp('NewtonIterHomotopy converged to a root!');
end