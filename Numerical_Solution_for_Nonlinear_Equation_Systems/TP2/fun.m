function f = fun(x)
%精确解为[1;...;1]
n = length(x);
f = zeros(n,1);
f(1)=sum(x.^2)-n;
for j = 2:n
    f(j) = (sum(x.^2)+1)*(x(j)-1) + x(j)*(sum(x)-x(j)) - n + 1;
end
end