function f=func_with_noise(x)
%����������ĺ���
%p:����ǿ��
p=1e-12;
f=func(x)+p*rand(1);
end