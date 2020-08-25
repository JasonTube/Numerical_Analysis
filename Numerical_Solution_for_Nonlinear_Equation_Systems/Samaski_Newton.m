function [x,k,res]=Samaski_Newton(x,eps,m)
% Samaski_Newton��
% ��ʼ����������x
% �������ȣ�eps
% ��������x
% ����������k
% Jacobi���󱣳ֲ�����m
k = 0;
b = fun(x);
r = norm(b);
res = [];
res = [res r];
while r > eps
    if mod(k,m)==0
        A = dfun(x);
    end
    deta = linsolve(A,-b);
    x = x+deta;
    if norm(deta)<= eps/10
        disp('Samaski_Newton: Change in X too small.');
        return;
    end
    b = fun(x);
    k = k + 1;
    if(k > 1000)
        disp('Samaski_Newton��Too many function iterations.');
        return;
    end
    r = norm(b);
    res = [res r];
end
disp('Samaski_Newton converged to a root!');
end