function df = forward(f,x0,h)
%��ǰ���
df = (f(x0+h)-f(x0)) / h;
end