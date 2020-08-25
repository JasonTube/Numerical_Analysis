e = 1;
a = -1;
N = 50;
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

%CGstart
tic;
count = 1;
U = zeros(length(A),1);
res0 = F-A*U;
k=1;
p = res0;
resCG = zeros(length(A),1);
resCG(1) = norm(F-A*U,inf);

while (resCG(k)>tol)
    k=k+1;
    Ap = A*p;
    alpha = res0'*res0/(p'*Ap);
    U = U + alpha*p;
    res1 =res0 - alpha*Ap;
    beta = res1'*res1/(res0'*res0);
    p =res1 +beta *p;
    res0 = res1;
    resCG(k)=norm(F-A*U,inf);
    count = count +1;
end
toc;
display(count)
%CGend

U=reshape(U,n,n);

t = ( 1 : n )' * h;
figure, surf ( t, t, U);



