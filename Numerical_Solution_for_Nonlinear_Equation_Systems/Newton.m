function [x,k,res]=Newton(x, eps)
% Newton法
% 初始迭代向量：x
% 迭代精度：eps
% 解向量：x
% 迭代次数：k
k = 0;
b = fun(x);
r = norm(b);
res = [];
res = [res r];
while r > eps
    A = dfun(x);
    deta = linsolve(A,-b);
    x = x+deta;
    if norm(deta)<= eps/10
        disp('Newton: Change in X too small.');
        return;
    end
    b = fun(x);
    k = k + 1;
    if(k > 1000)
        disp('Newton：Too many function iterations.');
        return;
    end
    r = norm(b);
    res = [res r];
end
disp('Newton converged to a root!');
end