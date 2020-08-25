function[U,n3,resCG]=CG(A,F,tol,maxstep)
tic;
U = zeros(length(A),1);
res0 = F-A*U;
n3 = 1;
p = res0;
resCG = zeros(length(A),1);
resCG(1) = norm(F-A*U,inf);

while (resCG(n3)>tol)
    n3=n3+1;
    Ap = A*p;
    alpha = res0'*res0/(p'*Ap);
    U = U + alpha*p;
    res1 = res0 - alpha*Ap;
    beta = res1'*res1/(res0'*res0);
    p = res1 + beta*p;
    res0 = res1;
    resCG(n3) = norm(F-A*U,inf);
    if n3>maxstep
        break
    end
end
display(n3);
toc;
end