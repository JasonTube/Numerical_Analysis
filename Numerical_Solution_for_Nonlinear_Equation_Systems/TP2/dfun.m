function df=dfun(x)
n = length(x);
df = zeros(n,n);
df(1,:)=2*x';
for i = 1:n
    for j = 2:n
        if i==j
            df(j,i) = 2*x(i)*(x(j)-1) + (sum(x.^2)+1) + sum(x) - x(j);
        else
            df(j,i) = 2*x(i)*(x(j)-1) + x(j);
        end
    end
end
end