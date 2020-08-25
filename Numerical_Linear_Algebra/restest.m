count=1:n21;
rjacobi=resjacobi(count);
rGS=resGS(count);
rSOR0=resSOR0(count);
rSOR1=resSOR1(count);
rCG=resCG(count);
plot(count,rjacobi ,count,rGS, count,rSOR0, count,rSOR1, count,rCG)
legend('rjacobi','rGS','rSOR0','rSOR1','rCG');
grid on