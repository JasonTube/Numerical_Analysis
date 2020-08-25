function [ v, beta ] = house ( x )
v = x;
alpha = - sign( x(1) ) * norm( x );
v(1) = x(1) - alpha;
beta = - 1 / ( alpha * v(1) );
end