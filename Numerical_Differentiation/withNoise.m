%%
clear;clc;close all;
%%
%��ʼ��
h = 10.^linspace(-0.25,-2.75);
L = length(h);
x0 = 1;
E_Forward = zeros(1,L);
E_Backward = zeros(1,L);
E_Central = zeros(1,L);
E_Richardson = zeros(1,L);
E_Implicit = zeros(1,L);
%%
%�������
syms x,y=func(x);
dfunc=diff(y);
for i = 1:L
    Exact_solution=subs(dfunc,x,x0);
    E_Forward(i) = abs(forward(@func_with_noise,x0,h(i)) - Exact_solution);
    E_Backward(i) = abs(backward(@func_with_noise,x0,h(i)) - Exact_solution);
    E_Central(i) = abs(central(@func_with_noise,x0,h(i)) - Exact_solution);
    E_Richardson(i) = abs(richardson(@func_with_noise,x0,h(i),3) - Exact_solution);
    E_Implicit(i) = abs(implicit(@func_with_noise,x0,h(i),20) - Exact_solution);
end
%%
%��ͼ��log scale

plot(log10(h),log10(E_Forward),'LineWidth',2);hold on;
plot(log10(h),log10(E_Backward),'--g','LineWidth',2);hold on;
plot(log10(h),log10(E_Central),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson),'LineWidth',2);hold on;
plot(log10(h),log10(E_Implicit),'LineWidth',2);
legend("E Forward","E Backward","E Central","E Richardson","E Implicit");
title("�����Է���ͼ,����ǿ��p=1e-12")
xlabel("����log10(h)")
ylabel("��log10(Error)")
grid minor