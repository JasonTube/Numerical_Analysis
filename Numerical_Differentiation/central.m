function df = central(f,x0,h)
%���Ĳ��
df = (f(x0+h)-f(x0-h)) / (2*h);
end