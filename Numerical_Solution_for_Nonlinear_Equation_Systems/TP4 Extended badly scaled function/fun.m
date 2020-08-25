function f=fun(x)
%Extended Powell badly scaled function
%Standard starting x0=[0;1;0;1;...];
%¾«È·½â£º[1.098...e-5;9.106...;1.098...e-5;9.106...;...]
n=length(x);
f=zeros(n,1);
for t=1:n/2
    f(2*t-1)=10^4*x(2*t-1)*x(2*t)-1;
    f(2*t)=exp(-x(2*t-1))+exp(-x(2*t))-1.0001;
end
end