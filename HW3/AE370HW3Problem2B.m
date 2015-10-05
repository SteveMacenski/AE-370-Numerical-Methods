%AE 370 Problem 2 hw 3 Steve Macenski 

clc;clear all;

%Setting constants 
N = 30;
n = 3/2;
U = zeros(1,N);
x = zeros(1,N);
r = (1/100)*[1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1 2 3];
Loc(1) = .02;

%Creating the x array for the different sized beads 
 for i = 2:N
Loc(i) = 2*r(i)+Loc(i-1);
x(i) = Loc(i-1);
 end
%Setting the new U for the new x array 
for i = 1:N
U(i) = 2/1000*cos(pi*x(i)/(2*x(N)));
end 
%constants determined 
E = 70e9;
v = .33; 
%Finding R star and E star based on prior work 
for i = 1:29
Rstar(i) = inv(inv(r(i))+inv(r(i+1)));
end
Rstar(30) = .03;
Estar = inv((1-v^2)/E + (1-v^2)/E);

%Finding all the Kij values via formula 
for i = 1:length(Rstar)
k(i) = (4/3)*Estar*sqrt(Rstar(i));
end 
tol = 1e-8;
F = 1;
g=0;

%completing algrithm for converganace 

while norm(F) > tol
    F = zeros(1,N);
    %Setting F
    
    for i = 2:N-2
        F(i) = k(i-1)*(U(i-1)-U(i)).^n-k(i)*(U(i)-U(i+1)).^n;
        i = i + 1;
    end 

        %setting gradient F 
    gradF = zeros(N,N);
    
        %populating gradF
    for i = 2:N-1
        gradF(i,i-1) = k(i-1)*n*(U(i-1)-U(i)).^(n-1);
        gradF(i,i)   = -k(i-1)*n*(U(i-1)-(U(i))).^(n-1)-k(i)*n*(U(i)-U(i+1)).^(n-1);
        gradF(i,i+1) = k(i)*n*(U(i)-U(i+1)).^(n-1); 
    end
   
    
    gradF(1,1) = 1;
    gradF(N,N) = 1;
    %iterating the new delta X and iterating more if new U is above tol 
    deltaX = -gradF\F';
    U = U + deltaX';
    g = g +1;

end 


fprintf('Convergance after %f iterations\n',g); %g = 7

for i = 1:N
    y(i) = x(i)+U(i)+r(i);
end
figure(1)
plot(y,U,'b','linewidth',2)

    F(1) = k(2)*abs((U(2)-U(3))).^n;
    F(N-1) = k(N-1)*abs((U(N-1)-U(N))).^n;


%%%% value of F1 = 2.74e3, value of FN = 2.743e3

fprintf('F1 is %f\n',F(1))
fprintf('FN is %f\n',F(N))



