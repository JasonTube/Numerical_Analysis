function df = backward(f,x0,h)
%Ïòºó²î·Ö
df = (f(x0)-f(x0-h)) / h;
end