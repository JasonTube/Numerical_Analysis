%%
clear;clc;close all;
%%
%初始化
h = 10.^linspace(-0.25,-2.75);
L = length(h);
x0 = 1;
E_Central = zeros(1,L);
E_Richardson_2 = zeros(1,L);
E_Richardson_3 = zeros(1,L);
E_Richardson_4 = zeros(1,L);
%%
%计算误差
syms x,y=func(x);
dfunc=diff(y);
for i = 1:L
    Exact_solution=subs(dfunc,x,x0);
    E_Central(i) = abs(central(@func,x0,h(i)) - Exact_solution);
    E_Richardson_2(i) = abs(richardson(@func,x0,h(i),2) - Exact_solution);
    E_Richardson_3(i) = abs(richardson(@func,x0,h(i),3) - Exact_solution);
    E_Richardson_4(i) = abs(richardson(@func,x0,h(i),4) - Exact_solution);
end
%%
%绘图：log scale
figure;
subplot(1,2,1);
plot(log10(h),log10(E_Central),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson_2),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson_3),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson_4),'LineWidth',2);
legend("E Central","E Richardson 2","E Richardson 3","E Richardson 4");
title("收敛性分析图")
xlabel("网格：log10(h)")
ylabel("误差：log10(Error)")
grid minor
%%
%绘图：log scale
subplot(1,2,2);
plot(log10(h),log10(E_Central)./log10(h),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson_2)./log10(h),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson_3)./log10(h),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson_4)./log10(h),'LineWidth',2);
legend("E Central","E Richardson 2","E Richardson 3","E Richardson 4");
title("收敛阶数分析图")
xlabel("log10(h)")
ylabel("log10(Error)/log10(h)")
grid minor