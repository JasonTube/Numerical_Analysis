function df = backward(f,x0,h)
%�����
df = (f(x0)-f(x0-h)) / h;
end