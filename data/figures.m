clear all
close all
clc

Nk = 20; Nj = 1000; N = 10000;
fileID = fopen('energy.bin');
E = fread(fileID,N,'double');
fileID = fopen('collided.bin');
Ec = fread(fileID,654,'double');
fileID = fopen('Ak.bin');
Ak = fread(fileID,Nk,'double');
fileID = fopen('ek.bin');
ek = fread(fileID,Nk,'double');
fileID = fopen('Amp.bin');
Amp = fread(fileID,Nj,'double');
fileID = fopen('J.bin');
J = fread(fileID,Nj,'int32');
fclose('all');

%%
close all
clc

figure(1)
loglog(Ak,ek,'o-k',Ak,1e3./Ak,'-r',[1e-4 1e-4],[1e5 1e-2],'--');
axis([1e-10 1e10 1e-10 1e5]);
xlabel('$\Delta A$','interpreter','latex');
ylabel('Error');
h=legend('Error','$\mathcal{O}(\frac{1}{\Delta A})$');

dim = [0.2 1e-8 0.4 0.5];
str = {'For $\Delta A<10^{-4}$, $Error=0$'};
annotation('textbox',dim,'String',str,'interpreter','latex','fontsize',25);

set(h,'interpreter','latex');
set(gca,'fontsize',25);

figure(2)
plot(Amp,J,Amp,2*N/pi*Amp,'-r');
xlabel('$A$','interpreter','latex');
ylabel('$N_c$','interpreter','latex');
axis([0.095 0.105 600 700]);
h=legend('$N_c$','$E[N_c]$');
set(h,'interpreter','latex','location','southeast');
set(gca,'fontsize',25);

figure(3)
histogram(E);
xlabel('$E_j$','interpreter','latex');
ylabel('$N$','interpreter','latex');
title('Energy distribution');
set(gca,'fontsize',25);

figure(4)
nbins=20;
histogram(Ec,nbins);
hold on
A = 0.1; Eg = linspace(0,1,nbins); dE = 1/nbins;
plot(Eg,N*dE*A*sin(pi*Eg),'-r');
xlabel('$E_j$','interpreter','latex');
ylabel('$N_c$','interpreter','latex');
title('Collided particles');
set(gca,'fontsize',25);
