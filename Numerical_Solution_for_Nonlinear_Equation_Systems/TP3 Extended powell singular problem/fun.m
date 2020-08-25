function f=fun(x)
%Extended Powell singular problem
%Standard Starting x0=[3;-1;0;1;3;-1;0;1;...]
%¾«È·½â [0;0;0;0;...]
    n=length(x);
    f=zeros(n,1);
    for t=1:n/4
        f(4*t-3)=x(4*t-3)+10*x(4*t-2);
        f(4*t-2)=sqrt(5)*(x(4*t-1)-x(4*t));
        f(4*t-1)=(x(4*t-2)-2*x(4*t-1))^2;
        f(4*t)=sqrt(10)*(x(4*t-3)-x(4*t))^2;
    end
end