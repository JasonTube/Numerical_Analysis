function[U,n1,resGS]=GS(A,F,tol,maxstep)
tic;
D = diag(diag(A));
Low = - tril(A,-1);
Up = - triu(A,1);
B = ( D-Low ) \ Up;
g = ( D-Low ) \ F;
U0 = zeros(length(A),1);
U = B*U0 + g;
n1 = 1;
resGS=zeros(length(A),1);
resGS(1)=norm(F-A*U,inf);
while (norm(U-U0,inf)>tol)
    U0 = U;
    U = B*U0+g;
    n1 = n1+1;
    resGS(n1) = norm(F-A*U,inf);
    if n1>maxstep
        break
    end
end
display(n1);
toc;
end
    