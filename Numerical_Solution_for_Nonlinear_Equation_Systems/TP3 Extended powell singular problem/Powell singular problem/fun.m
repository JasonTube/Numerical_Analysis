function f=fun(x)
%Powell singular problem
%stantard starting point [3;-1;0;1]
%¾«È·½â£º[0;0;0;0]
    f=zeros(4,1);
    f(1)=x(1)+10*x(2);
    f(2)=sqrt(5)*(x(3)-x(4));
    f(3)=(x(2)-2*x(3))^2;
    f(4)=sqrt(10)*(x(1)-x(4))^2;
end