function[U,n20,resSOR]=SOR0(A,F,tol,maxstep)
tic;
w = 1.5;
n20 = 1;
U = zeros(length(A),1);
resSOR = zeros(length(A),1);
resSOR(1)= norm(F-A*U,inf);

while (resSOR(n20) > tol)
    n20 = n20 + 1;
    for i = 1:length(A);
        U(i) = U(i)+(F(i)-A(i,:)*U)*w/A(i,i);
    end
    resSOR(n20) = norm(F-A*U,inf);
     if n20>maxstep
        break
    end
end
display(n20);
toc;
end