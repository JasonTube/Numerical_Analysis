%%
clear;clc;close all;
%%
%初始化
h = 10.^linspace(-0.25,-2.75);
L = length(h);
x0 = 1;%求导点
f=@func;%测试函数
E_Forward = zeros(1,L);
E_Backward = zeros(1,L);
E_Central = zeros(1,L);
E_Richardson = zeros(1,L);
E_Implicit = zeros(1,L);
%%
%计算误差
syms x,y=f(x);
dfunc=diff(y);
for i = 1:L
    Exact_solution=subs(dfunc,x,x0);
    E_Forward(i) = abs(forward(f,x0,h(i)) - Exact_solution);
    E_Backward(i) = abs(backward(f,x0,h(i)) - Exact_solution);
    E_Central(i) = abs(central(f,x0,h(i)) - Exact_solution);
    E_Richardson(i) = abs(richardson(f,x0,h(i),3) - Exact_solution);
    E_Implicit(i) = abs(implicit(f,x0,h(i),20) - Exact_solution);
end
%%
%绘图：log scale
figure;
subplot(1,2,1);
plot(log10(h),log10(E_Forward),'LineWidth',2);hold on;
plot(log10(h),log10(E_Backward),'--g','LineWidth',2);hold on;
plot(log10(h),log10(E_Central),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson),'LineWidth',2);hold on;
plot(log10(h),log10(E_Implicit),'LineWidth',2);
legend("E Forward","E Backward","E Central","E Richardson","E Implicit");
title("收敛性分析图")
xlabel("网格：log10(h)")
ylabel("误差：log10(Error)")
grid minor
%%
%绘图：log scale
subplot(1,2,2);
plot(log10(h),log10(E_Forward)./log10(h),'LineWidth',2);hold on;
plot(log10(h),log10(E_Backward)./log10(h),'--g','LineWidth',2);hold on;
plot(log10(h),log10(E_Central)./log10(h),'LineWidth',2);hold on;
plot(log10(h),log10(E_Richardson)./log10(h),'LineWidth',2);hold on;
plot(log10(h),log10(E_Implicit)./log10(h),'LineWidth',2);
legend("E Forward","E Backward","E Central","E Richardson","E Implicit");
title("收敛阶数分析图")
xlabel("log10(h)")
ylabel("log10(Error)/log10(h)")
grid minor