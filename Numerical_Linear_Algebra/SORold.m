% ------------------------------------------------------------------------
% SOR迭代法求解方程组
% 2018-11-08 09:04:29
% ------------------------------------------------------------------------
epsilon = 1;
n = 100;
h = 1 / n;
a = 1 / 2;
eps = 1.0e-6;
 
d = - ( 2 * epsilon + h );
up = epsilon + h;
tmp = ones( n - 1 ,1 );
A = d * eye( n ) + epsilon * diag( tmp ,-1 ) + up * diag( tmp ,1 );
b = a * h^2 * ones( n ,1 );
b(n) = b(n) - epsilon - h;
 
D = diag( diag( A ) );
L = - tril( A ,-1 );
U = - triu( A ,1 );

w=unifrnd (0,2);
B = (D - w*L) \ ((1-w) * D + w*U);
f = w * inv(D - w*L) * b; %#ok<MINV>

x0 = zeros(n,1);
x = B*x0 + f;

while norm(b - A * x) > eps
    x0 = x;
    x = B*x0 + f;
end
plot(x)

t = h * (1:n);
y = (1-a)/(1-exp(-1/epsilon)) * ( 1 - exp(-t/epsilon) ) + a * t;
hold on, plot(y,':')




