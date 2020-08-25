e = 1;
a = 1;
N = 10;
h = 1/N;
n = N-1;
tol = 1e-6;

d = 4*e - a*h;
up = -e +a*h;
tmp = ones(n-1,1);
E = -e * eye(n);
S = d * eye(n) + up * diag(tmp,1) - e*diag(tmp,-1);
I = eye(n);
tmp2 = diag(tmp,1) + diag(tmp,-1);
A = kron(I,S)+kron(tmp2,E);

T=diag([-1,2,1]);
tmp = ones(n-1,1);
B=-eye(n)+diag(tmp,1);
I=eye(n);
A=e*(kron(I,T)+kron(T,I))+a*h*kron(I,B);

F = ones(n);
for i =1:n;
    for j=1:n;
        x=i/N;
        y=i/N;
        F(i,j)=pi*(2*pi*e+a)*(sin(pi*x)+cos(pi*y))*sin(pi*y);
    end
end
F = reshape(F,n^2,1);
F = h^2*F;

