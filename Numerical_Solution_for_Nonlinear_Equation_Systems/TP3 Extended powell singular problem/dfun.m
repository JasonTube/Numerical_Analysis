function df=dfun(x)
n=length(x);
df=zeros(n,n);
for t=1:n/4
    df(4*t-3:4*t,4*t-3:4*t)=[1,10,0,0;
        0,0,sqrt(5),-sqrt(5);
        0,2*(x(4*t-2)-2*x(4*t-1)),2*(x(4*t-2)-2*x(4*t-1))*(-2),0;
        2*sqrt(10)*(x(4*t-3)-x(4*t)),0,0,-2*sqrt(10)*(x(4*t-3)-x(4*t))];
end
end