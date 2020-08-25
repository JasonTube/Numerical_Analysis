% ------------------------------------------------------------------------
% Householder º¯Êý
% H = I- beta * v * v'
% H * x = alpha * eye( n,1 )
% 2018-10-26 13:48:14
% ------------------------------------------------------------------------
function [ v, beta ] = houseDIY ( x )
n = length ( x );
eta = norm( x,Inf );
x = x / eta;
sigma = x( 2:n )'* x( 2:n );
v( 2:n ) = x( 2:n );
if sigma == 0
    %H=I
    beta = 0;
else
    %alpha = norm(x)
    alpha = sqrt ( x(1)*x(1) + sigma );
    if x(1) <= 0
        v(1) = x(1) - alpha;
    else
        %if x->[1;0;...;0]
        v(1) = - sigma / (x(1) + alpha);
    end
    beta = 2*v(1)*v(1) / (sigma + v(1)*v(1));
    v = (v / v(1))';
end
end

