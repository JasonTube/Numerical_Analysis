
n = 5;
e = 1;
a = 1/2;
h = 1/n;

d = - ( 2*e + h );
up = e + h;
tmp = ones(n-1,1);
A = d * eye(n) + e*diag(tmp,-1) + up*diag(tmp,1);

L = sparse( 2:n, 1:n-1, tmp, n, n );
B = d * speye(n) + e * L + up * L';

tv = ones(n,1);
%C = spdiags( [e*tv, d*tv, up*tv], -1:1, n, n );
C = spdiags( repmat(tv,3)*diag([e,d,up]), -1:1, n, n );

D = d * eye(n);
for k = 1 : n-1
    D(k,k+1) = up;
end
for k = 1 : n-1
    D(k+1,k) = e;
end


norm(A-D), spy(D)