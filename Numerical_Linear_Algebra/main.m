maxstep = 2e4;
e = 1;
a = -100;
N = 50;
h = 1/N;
n = N-1;
tol = 1e-6;
 
d = 4*e - a*h;
up = -e + a*h;
tmp = ones(n-1,1);
E = -e * eye(n);
S = d * eye(n) + up * diag(tmp,1) - e * diag(tmp,-1);
I = eye(n);
tmp2 = diag(tmp,1) + diag(tmp,-1);
A = kron(I,S)+kron(tmp2,E);
 
F = ones(n);
for i = 1:n-1;
    for j = 1:n;
        x = i/N;
        y = j/N;
        F(i,j)=pi * (2*pi*e*sin(pi*x) + a*cos(pi*x)) * sin(pi*y);
    end
end
F = reshape(F,n^2,1);
F = h^2*F;
 
[u0,n0,resjacobi] = Jacobi(A,F,tol,maxstep);
[u1,n1,resGS] = GS(A,F,tol,maxstep);
[u20,n20,resSOR0] = SOR0(A,F,tol,maxstep);
[u21,n21,resSOR1] = SOR1(A,F,tol,maxstep);
[u3,n3,resCG] = CG(A'*A,A'*F,tol,maxstep);
 
%plot:res
count = 1: length(A)/8;
rjacobi = resjacobi(count);
rGS = resGS(count);
rSOR0 = resSOR0(count);
rSOR1 = resSOR1(count);
rCG = resCG(count);
figure,plot(count,rjacobi ,count,rGS, count,rSOR0, count,rSOR1, count,rCG)
legend('rjacobi','rGS','rSOR0','rSOR1','rCG');
grid on
 
%plot:solution of equation
u0=reshape(u0,n,n);
t = ( 1 : n )' * h;
figure, surf ( t, t, u0);