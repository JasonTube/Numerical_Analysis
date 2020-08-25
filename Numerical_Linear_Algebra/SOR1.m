function[U,n21,resSOR]=SOR1(A,F,tol,maxstep)
tic;
D = diag( diag( A ) );
Low = - tril( A ,-1 );
Up = - triu( A ,1 );
B=D\(Low+Up);
row=max(abs(eig(B)));
w=2/(1+sqrt(1-row^2));
clear D Low Up B row;
toc;
tic;
n21 = 1;
U = zeros(length(A),1);
resSOR = zeros(length(A),1);
resSOR(1)= norm(F-A*U,inf);

while (resSOR(n21) > tol)
    n21 = n21 + 1;
    for i = 1:length(A);
        U(i) = U(i)+(F(i)-A(i,:)*U)*w/A(i,i);
    end
    resSOR(n21)=norm(F-A*U,inf);
     if n21>maxstep
        break
    end
end
display(n21);
toc;
end