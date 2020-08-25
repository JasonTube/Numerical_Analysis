% ------------------------------------------------------------------------
% *Gauss Elimination with Partial Pivoting
% JJY, 2018/10/18, WHU
% ------------------------------------------------------------------------
clear all ; close all ; clc

% settings
n = 100;
A = rand(n);
b = A * ones(n,1);
pvec = 1 : 1 : n; % record the permutation
L = eye (n);
U = eye (n);

% GEPP:
for k = 1 : n-1
    [ ~, indMax ] = max( abs( A(k:end,k) ) );
    indMax = indMax + k - 1;
    pvec([k indMax]) =  pvec ([indMax k]);
    A([k indMax],:) = A([indMax k],:);
    
    A(k+1:n ,k) =  A(k+1:n ,k) / A(k ,k); % multiplier
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - ...
        A(k+1:n,k) * A(k,k+1:n);
end % k = 1 : n-1

b = b(pvec);

% L = tril(A,-1) + eye(n);
for k = 1 : n
    L(k,k) = 1;
    L(k+1:end,k) = A(k+1:end,k);
end

% U = triu(A);
for k = 1 : n
    U(k,k:end) = A(k,k:end);
end

x =  U \ ( L \ b )

