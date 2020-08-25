%%
clear;clc;close all;
%%
%初始化
h = 10.^linspace(-0.25,-2.75);
L = length(h);
x0 = 1;
E_Forward = zeros(1,L);
E_Backward = zeros(1,L);
E_Central = zeros(1,L);
E_Richardson = zeros(1,L);
E_Implicit = zeros(1,L);
%%
%计算误差
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
%绘图：log scale

plot(log10(h),log10(E_Forward),'LineWidth',2);hold on;
plot(log10(h),log10(E_Backward),'--g','LineWidth',2);hold on;
plot(log10(h),log10(E_Central),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson),'LineWidth',2);hold on;
plot(log10(h),log10(E_Implicit),'LineWidth',2);
legend("E Forward","E Backward","E Central","E Richardson","E Implicit");
title("收敛性分析图,噪声强度p=1e-12")
xlabel("网格：log10(h)")
ylabel("误差：log10(Error)")
grid minor