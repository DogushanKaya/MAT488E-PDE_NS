
% The MAIN program for solving the_heat equation in 1-D:
% it solves a u_xx = u_t  for 0<=x<=xf, 0<=t<=T
% you can save it as solve_heat.m 
% With this program, you can run explicit, implicit and 
% Crank-Nicholson methods.

%the parameter             %initial condition                       %boundary condition
a=1;  T=0.1; xf=1;         it0=inline('x.^4','x');                  bx0=inline('0');  bxf=inline('1'); 
%a=1e-5; T=6000; xf=1;      it0=inline('2*x + sin(2*pi*x)','x');     bx0=inline('0');  bxf=inline('2'); 
%a=2; T=0.2; xf=pi;         it0=inline('sin(2*x)','x');              bx0=inline('0');  bxf=inline('0'); 
%a=1; T=0.1; xf=1;          it0=inline('sin(pi*x)+sin(3*pi*x)','x'); bx0=inline('0');  bxf=inline('0');
M=25;  N=100; %r=0.625 
%analytical solution
uo=inline('sin(pi*x)*exp(-pi*pi*t)','x','t'); 
[u1,x,t]=hwk2_heat_exp(a,xf,T,it0,bx0,bxf,M,N); 
figure(1), clf, mesh(t,x,u1)
[u2,x,t]=hwk2_heat_imp(a,xf,T,it0,bx0,bxf,M,N); %converge unconditionally
figure(2), clf, mesh(t,x,u2)
[u3,x,t]=hwk2_heat_CN(a,xf,T,it0,bx0,bxf,M,N); %converge unconditionally
figure(3), clf, mesh(t,x,u3)
MN=M*N;
Uo= uo(x,t); aUo=abs(Uo)+eps; %values of true analytical solution
%How far from the analytical solution?
disp('Error in explicit scheme')
err1= norm((u1-Uo)./aUo)/MN
disp('Error in implicit scheme')
err2= norm((u2-Uo)./aUo)/MN
disp('Error in Crank-Nicholson scheme')
err3= norm((u3-Uo)./aUo)/MN
% THE END OF solve_heat.m program ***************************************
