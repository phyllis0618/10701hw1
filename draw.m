% draw synthetic data

n = 200;
p = 2;

rho   = [0 .75 .99 .75 .75 .75];
sigma = [0 0 0 0 .05 .2];


titles = {'independent features', 'medium correlated', 'strongly correlated', 'no noise', ...
'medium noise', 'many noise'};
figure(1)
clf

for i = 1 : 6

    [Y,X,w] = gen_synthetic(n,p,rho(i),sigma(i));
    subplot(2,3,i)
    plot(X(Y>0,1),X(Y>0,2),'ob')
    hold on
    plot(X(Y<0,1),X(Y<0,2),'xr')
    xlim([-.25 .25])
    ylim([-.25 .25])
    title(titles{i},'fontsize', 20)
end
%Undefined function 'gen_synthetic' for input arguments of type
'double'
 