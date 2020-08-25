% ------------------------------------------------------------------------
% 用QR分解求解最小二乘问题min||Ax-b||
% 2018-11-01 08:13:58
% ------------------------------------------------------------------------
clear all ; close all ; clc

t = [ 1.0, 2.0, 3.0, 4.0 ]';
A = [ t.^0, t.^1, t.^2 ];
b = [ 0.8415, 0.9093, 0.1411, -0.7568 ]';

[ m, n ] = size( A );
d = zeros( 1 ,min( [ m ,n ] ) );

% A = Q * R
for j = 1 : n;
    if j < m
        [ v ,beta ] = houseDIY( A( j :m ,j ) );
        A( j :m ,j :n ) = ( eye( m - j + 1 ) - beta * v * v') * A( j :m ,j :n );
        d( j ) = beta;
        A( j + 1 :m ,j ) = v( 2 :m - j + 1 );
    end
end

% output Q
v( 1 ) = 1;
v( 2 :m ) = A( 2 :m ,1 );
Q = eye( m )- d(1) * v * v';
for i = 2 : n
v = ones( m - i + 1,1);   %否则v受到前面步骤的影响
v( 2 :m - i + 1) = A( i + 1 :m ,i );
h = eye( m - i + 1 ) - d( i ) *  v * v';
H = blkdiag( eye( i - 1 ) ,h );
Q = Q * H;
end
