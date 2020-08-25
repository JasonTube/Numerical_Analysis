function df=dfun(x)
n=length(x);
df=zeros(n,n);
for t=1:n/2
df(2*t-1:2*t,2*t-1:2*t)=[10^4*x(2*t-1) 10^4*x(2*t);
    -exp(-x(2*t-1)) -exp(-x(2*t))];
end