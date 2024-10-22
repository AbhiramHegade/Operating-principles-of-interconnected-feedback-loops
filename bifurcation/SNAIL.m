function out = SNAIL
out{1} = @init;
out{2} = @fun_eval;
out{3} = [];
out{4} = [];
out{5} = [];
out{6} = [];
out{7} = [];
out{8} = [];
out{9} = [];
%-----------------------------------------------------------------------------------------------------
function dydt = fun_eval(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)

%Lm function components
Mu0=1/(1+kmrgd(1)/xnot)^nmu;
Mu1=(kmrgd(1)/xnot)/(1+kmrgd(1)/xnot)^nmu;
Mu2=(kmrgd(1)/xnot)^2/(1+kmrgd(1)/xnot)^nmu;
Mu3=(kmrgd(1)/xnot)^3/(1+kmrgd(1)/xnot)^nmu;
Mu4=(kmrgd(1)/xnot)^4/(1+kmrgd(1)/xnot)^nmu;
Mu5=(kmrgd(1)/xnot)^5/(1+kmrgd(1)/xnot)^nmu;
Mu6=(kmrgd(1)/xnot)^6/(1+kmrgd(1)/xnot)^nmu;

%Hills functions
H1=(z1^n1+lam1*kmrgd(3)^n1)/(z1^n1+kmrgd(3)^n1);
H2=(s1^n2+lam2*S^n2)/(s1^n2+S^n2);
H3=(z2^n3+lam3*kmrgd(3)^n3)/(z2^n3+kmrgd(3)^n3);
H4=(s2^n4+lam4*S^n4)/(s2^n4+S^n4);

%Equations
dydt=[g1*H1*H2-k1*kmrgd(1);
    g2*H3*H4-k2*kmrgd(2);
    g3*kmrgd(2)*(Mu0*l0+l1*6*Mu1+l2*15*Mu2+l3*20*Mu3+l4*15*Mu4+l5*6*Mu5+l6*Mu6)-k3*kmrgd(3)] ;
    
    % --------------------------------------------------------------------------
function [tspan,y0,options] = init
handles = feval(SNAIL);
y0=[0,0,0,0];
options = odeset('Jacobian',[],'JacobianP',[],'Hessians',[],'HessiansP',[]);
tspan = [0 10];

% --------------------------------------------------------------------------
function jac = jacobian(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)
% --------------------------------------------------------------------------
function jacp = jacobianp(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)
%--------------------------------------------------------------------------
function hess = hessians(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)
%--------------------------------------------------------------------------
function hessp = hessiansp(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)
%---------------------------------------------------------------------------
function tens3  = der3(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)
%---------------------------------------------------------------------------
function tens4  = der4(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)
%---------------------------------------------------------------------------
function tens5  = der5(t,kmrgd,S,g1,g2,g3,z1,z2,s1,s2,lam1,lam2,lam3,lam4,k1,k2,k3,n1,n2,n3,n4,l0,l1,l2,l3,l4,l5,l6,xnot,nmu)