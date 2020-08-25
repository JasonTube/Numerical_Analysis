function [x,k,res]=Gauss_Newton(x0, eps)
% Gauss_Newton法
% 初始迭代向量：x
% 迭代精度：eps
% 解向量：x
% 迭代次数：k
x = x0;
k = 0;
J = dfun(x);
F = fun(x);
b = J'*F;
r = norm(F);
res = [];
res = [res r];
while r > eps
    A = J'*J;
    deta = linsolve(A,-b);
    x = x+deta;
    if norm(deta)<= eps/10
        disp('Gauss_Newton：Change in X too small.');
        return;
    end
    J = dfun(x);
    F = fun(x);
    b = J'*F;
    k = k + 1;
    if(k > 1000)
        disp('Gauss_Newton：Too many function iterations.');
        return;
    end
    r = norm(F);
    res = [res r];
end
disp('Gauss_Newton converged to a root!');
end