function f = fun(x)
%��ȷ��Ϊ[1;...;1]
n = length(x);
f = zeros(n,1);
for j = 1:n
    f(j) = (sum(x.^2)+j)*(x(j)-1) + x(j)*(sum(x)-x(j)) - n + 1;
end
%f=(x-1).*(sum(x.^2)+(1:n))+x.*(sum(x)-x)-n+1;
end