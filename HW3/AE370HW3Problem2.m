%AE 370 Problem 2 hw 3 Steve Macenski 

clc;clear all;

%Setting constants
N = 20;
n = 3/2;
U = zeros(1,N);
x = zeros(1,N);
r = .5/100;
%writing in the x vector
for i = 1:N
    x(i) = .5/1000*2*i -.5*2/1000;
end
%using x to find U guess
for i = 1:N
    U(i) = .5/1000*cos(pi*x(i)/(2*x(N)));
end 
%constants 
E = 210e9;
v = .25; 

%finding R start and E star from constants 
Rstar = inv(inv(r)+inv(r));
Estar = inv((1-v^2)/E + (1-v^2)/E);
k = 4/3*Estar*sqrt(Rstar);


%setting tolerance 
tol = 1e-8;
F = 1;
g=0;
%Completing the iterative method to finding the number of times for
%convergance 
while norm(F) > tol
    F = zeros(1,N);
    for i = 1:N-2 %Setting the vector F
        F(i+1) = k*(U(i)-U(i+1)).^n-k*(U(i+1)-U(i+2)).^n;
        i = i + 1;
    end 

    gradF = zeros(N,N);
    for i = 2:N-1 %Setting the matrix gradient of F
        gradF(i,i-1) = k*n*(U(i-1)-U(i)).^(n-1);
        gradF(i,i)   = -k*n*(U(i-1)-(U(i))).^(n-1)-k*n*(U(i)-U(i+1)).^(n-1);
        gradF(i,i+1) = k*n*(U(i)-U(i+1)).^(n-1); 
    end
    gradF(1,1) = 1;
    gradF(N,N) = 1;
            %finding the delta X and iterating if not below tolerance 
    deltaX = -gradF\F';
    U = U + deltaX';
    g = g +1;

end 
fprintf('Convergance after %f iterations\n',g); %g = 7

for i = 1:N
   y(i) = x(i)+U(i)+r;
end
figure(1)


    F(1) = k*abs((U(2)-U(3))).^n;
    F(N-1) = k*abs((U(N-1)-U(N))).^n;
    
plot(y,U,'b','linewidth',2)


fprintf('F1 is %f\n',F(1))
fprintf('FN is %f\n',F(N-1))


    
    
    
    
    
