function f=fun(x)
%Powell badly scaled function
%Standard starting x0=[0,1];
%¾«È·½â£º[1.098...e-5;9.106...]
f=zeros(2,1);
f(1)=10^4*x(1)*x(2)-1;
f(2)=exp(-x(1))+exp(-x(2))-1.0001;
end