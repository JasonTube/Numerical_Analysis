function[]=plotU(N,u)
h = 1/N;
n = N-1;
u=reshape(u,n,n);
t = ( 1 : n )' * h;
figure, surf ( t, t, u);
end