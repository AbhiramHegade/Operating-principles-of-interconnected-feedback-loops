function [x,v,s,h,f] = SNAIL_bifur

curdir = pwd;
init;
cd(curdir)
opt = contset;
opt=contset(opt,'Singularities',1);
opt=contset(opt,'MaxNumPoints',50000); %500000
opt=contset(opt,'MinStepsize',1);
opt=contset(opt,'MaxStepsize',100);
opt=contset(opt,'Eigenvalues',1);

% Degradation rate:
k1=0.05; k2=0.5; k3=0.1;

% Transcription rate:
g1=1500; g2=12.5; g3=100;

% Hills function threshold :
 z1=200000; z2=50000; s1=180000; s2=180000; xnot=10000;

 % Cooperativity:
n1=2; n2=1; n3=2; n4=1; nmu=6;

% fold change
lam1=0.1; lam2=0.4; lam3=15; 
lam4=10.0;

%Translational Inhibition rates:
l0=1.0; l1=0.5; l2=0.2; l3=0.02; l4=0.02; l5=0.02; l6=0.02;

% SNAIL   %put S=0 when it is a bifurcation parameter
S=0;  % S=0

% lam3   %put lam3=0 when it is a bifurcation parameter
%lam3=30;

ap = 1; %describes the index of parameter for which the bifurcation is drawn using the init_EP_EP function. Currently, ap=1, thus bifurcation parameter is s (SNAIL levels)
handles = feval(@SNAIL);
tspan = 0:100:50000;

% initial condition
x_start = [50000 500 0]; %[33554.833280 56.5 0];   

%calculating steady state for given initial condition 
[t,x_time] = ode15s(@(t,kmrgd)handles{2}(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu),tspan,x_start);
x_init = x_time(end,:)';

%drawing bifurcation using a continuation method
[x0,v0] = init_EP_EP(@SNAIL,x_init,[S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu],ap);
[x,v,s,h,f] = cont(@equilibrium, x0, v0,opt);