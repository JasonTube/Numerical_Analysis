function [x,k,res]=Levenberg_Marquardt(x0,eps)
% Levenberg_Marquardt法
% 初始迭代向量：x0
% 迭代精度：eps
% 解向量：x
% 迭代次数：k
n = length(x0);
x = x0;
k = 0;
J = dfun(x);
F = fun(x);
lambda = norm(F);
b = J'*F;
res = [];
res = [res lambda];
while lambda > eps
    A = J'*J + lambda*eye(n);
    deta = linsolve(A,-b);
    x = x+deta;
    if norm(deta)<= eps/10
        disp('Levenberg_Marquardt: Change in X too small.');
        return;
    end
    J = dfun(x);
    F = fun(x);
    lambda = norm(F);
    res = [res lambda];
    b = J'*F;
    k = k + 1;
    if(k > 1000)
        disp('Levenberg_Marquardt：Too many function iterations.');
        return;
    end
end
disp('Levenberg_Marquardt converged to a root!');
end