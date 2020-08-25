function[U,n0,resjacobi]=Jacobi(A,F,tol,maxstep)
tic;
n0 = 1;
U = zeros(length(A),1);
resjacobi = zeros( length(A),1 );
resjacobi(1) = norm(F-A*U,inf);
d = diag(A);

while (resjacobi(n0) > tol)
    n0 = n0 + 1;
    res = F - A * U;
    U = U + res ./ d;
    resjacobi(n0) = norm(F-A*U,inf);
    if n0 > maxstep
        break
    end
end
display(n0);
toc;
end