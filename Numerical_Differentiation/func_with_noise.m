function f=func_with_noise(x)
%引入噪声后的函数
%p:噪声强度
p=1e-12;
f=func(x)+p*rand(1);
end