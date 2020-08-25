clear;clc;
eps = 1e-6;%精度
%%
%算例1：x0初始化
n = 1000;%方程组维数
x0 = zeros(n,1);
x0(1:2:end) = -3; x0(2:2:end) = 3;
%%
warning('off')
tic;[x1, k1 ,res1]=Newton(x0, eps);toc;
tic;[x2, k2 ,res2]=Samaski_Newton(x0, eps, 3);toc;
tic;[x3, k3 ,res3]=Gauss_Newton(x0, eps);toc;
tic;[x4, k4 ,res4]=Levenberg_Marquardt(x0, eps);toc;
tic;[x5, k5 ,res5]=NewtonIterHomotopy(x0,eps,10);toc;
tic;[x6, k6 ,res6]=Broyden(x0, eps);toc;
warning('on');
%%
%收敛曲线绘图
displayIters = 200;%最大展示迭代步数
len=min(displayIters,length(res1));
plot(0:len-1,log10(res1(1:len)),'-o','LineWidth',1.5);hold on
len=min(displayIters,length(res2));
plot(0:len-1,log10(res2(1:len)),'--','LineWidth',1.5);hold on
len=min(displayIters,length(res3));
plot(0:len-1,log10(res3(1:len)),'--*','LineWidth',1.5);hold on
len=min(displayIters,length(res4));
plot(0:len-1,log10(res4(1:len)),'--+','LineWidth',1.5);hold on
len=min(displayIters,length(res5));
plot(0:len-1,log10(res5(1:len)),'-->','LineWidth',1.5);hold on
len=min(displayIters,length(res6));
plot(0:len-1,log10(res6(1:len)),'-','LineWidth',1.5);hold off
grid minor;axis tight;
title('n=1000 performance of Algs')
xlabel('Iters');ylabel('Log_1_0(res)');
legend('Newton','SamaskiNewton','GaussNewton','LevenbergMarquardt',...
    'NewtonIterHomotopy','Broyden');
