maxstep =10^6;
e = 1;
a = -1;
N = 50;
h = 1/N;
n = N-1;
tol = 1e-6;
w=1.5;

d = 4*e - a*h;
up = -e +a*h;
tmp = ones(n-1,1);
E = -e * eye(n);
S = d * eye(n) + up * diag(tmp,1) - e*diag(tmp,-1);
I = eye(n);
tmp2 = diag(tmp,1) + diag(tmp,-1);
A = kron(I,S)+kron(tmp2,E);

F = ones(n);
for i =1:n-1;
    for j=1:n;
        x=i/N;
        y=j/N;
    F(i,j)=pi*(2*pi*e*sin(pi*x)+a*cos(pi*x))*sin(pi*y);
    end
end
F = reshape(F,n^2,1);
F = h^2*F;

%SOR_start
tic;
count = 1;

U = zeros(n^2,1);
res = Inf;

while norm(res) > tol
    res = F-A*U;
    for i = 1:n^2;
        U(i) = U(i)+(F(i)-A(i,:)*U)*w/A(i,i);
    end
    count = count + 1;
end
toc;
y = toc;
display(count)
%SOR_end

U=reshape(U,n,n);

t = ( 1 : n )' * h;
figure, surf ( t, t, U);
