%Completed by Steve Macenski HW 370 Problem 4 hw 1
clf
clc
clear all

% Establishes range and constants 
x = -pi:.1:pi;
deltax = 10^-5;

%Establishes formula and calculates the der. for the x range 
Fprime = (cos(x+deltax)+sin(2*(x+deltax))-cos(x-deltax)-sin(2*(x-deltax)))/(2*deltax);
Fdoubleprime = (cos(x+deltax)+sin(2*(x+deltax))-2*(cos(x)+sin(2*x))+cos(x-deltax)+sin(2*(x-deltax)))/(deltax^2);

%plots the der. in the same plot
figure(1)
plot(x,Fprime,x,Fdoubleprime)
xlabel('x');
ylabel('Derivatives');
title('Steve Macenski');

%Establishes the new range and actual derivative values 
deltax = logspace(-7,-1,10000);
x = 0;
FprimeActual = 2;
FdoubleprimeActual = -1; 

%Calculates the estimated der. in the logspace range 
Fprime = (cos(x+deltax)+sin(2*(x+deltax))-cos(x-deltax)-sin(2*(x-deltax)))./(2.*deltax);
Fdoubleprime = (cos(x+deltax)+sin(2*(x+deltax))-2*(cos(x)+sin(2*x))+cos(x-deltax)+sin(2*(x-deltax)))./(deltax.^2);

%Finds the error between actual and the stored value for the estimation 
Epsilon1 = abs(100*((FprimeActual - Fprime)/FprimeActual));
Epsilon2 = abs(100*((FdoubleprimeActual - Fdoubleprime)/FdoubleprimeActual));

%Plots the figures on a loglog scale
figure(2);
loglog(deltax,Epsilon1,deltax,Epsilon2);
grid on
xlabel('Delta x value');
ylabel('Epsilon values');
title('Steven Macenski');