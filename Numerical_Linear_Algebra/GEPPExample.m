% 
% *Gauss Elimination with Partial Pivoting
% Author, 2018.10.18, WHU

% Settings:
n = 5;
A = rand(5);
b = A * ones(n,1);
pvec = 1 : 1 : n; % record the permutation

% GEPP:
for k = 1 : n-1
    [ ~, indMax ] = max( abs( A(k:end,k) ) );
    indMax = indMax + k - 1;
    pvec([k indMax]) = pvec([indMax k]);
    A([k indMax],:) = A([indMax k],:);
    
    A( k+1:n, k ) = A( k+1:n, k ) / A( k, k ); % multiplier
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - ...
        A(k+1:n,k) * A(k,k+1:n);
end % k = 1 : n-1

b = b(pvec);

L = tril(A,-1) + eye(n);
U = triu(A);
x = U \ ( L \ b )
    
    
    
    
