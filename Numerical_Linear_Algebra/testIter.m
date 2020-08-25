
n = 100; e = 1; a = 1/2; h = 1/n;
tol = 1e-6;

d = - ( 2*e + h );
up = e + h;
tmp = ones(n-1,1);
A = d * eye(n) + e*diag(tmp,-1) + up*diag(tmp,1);
b = a*h^2 * ones(n,1);
b(end) = b(end) - e - h;

x = zeros(n,1);
res = Inf;
% D = diag( diag(A) );
d = diag(A);

while norm(res) > tol
    res = b - A * x;
    x = x + res ./ d;%res d 的元素依次相除
end
plot(x)

t = h * (1:n);
y = (1-a)/(1-exp(-1/e)) * ( 1 - exp(-t/e) ) + a * t;
hold on, plot(y,':')

