% AE 370 Steven Macenski Problem 1 hw 3
clf;clc;clear all;

%Defining constants 
M = 6.5;
Ptp = 4052; 
                        tic %timing
a=1.1;
b=10;

%Checking inputs for root
if fn(a)*fn(b) >=0
sprintf( 'this interval does not contain a root')
else
tol=.5;
sprintf('a=%17.9f f(a)=%17.9f b=%17.9f f(b)=%17.9f\n',a,fn(a),b,fn(b));
%Bisectional method 
while b-a > tol;
    c=(a+b)/2;
    if fn(a)*fn(c) > 0;
        a=c;
    else
        b=c;
    end
%Printing results 
fprintf('a=%17.9f f(a)=%17.9f b=%17.9f f(b)=%17.9f\n',a,fn(a),b,fn(b));
end
fprintf(' the root is in the interval %17.9f ... %17.9f\n',a,b);
end
                    toc %timing
tol2 = 1e-10;
 
%Setting gammas 
gamma(1) = a;
gamma(2) = b;
i = 3;
error = 1;
x1 = 0;
                    tic %timing
%using secant method to get the convergance to error levels. 
while error > tol2;
    gamma(i) = gamma(i-1) -fn(gamma(i-1))*((gamma(i-1)-gamma(i-2))./(fn(gamma(i-1))-fn(gamma(i-2))));
    error = abs(gamma(i) - gamma(i-1));
    i = i + 1;
end 
                    toc %timing 
    
x = 1.1:.01:1.3372; %writing the function in to y
for i = 1:length(x)
    y(i) = fn(x(i));
end

%plotting
plot(x,y);
xlabel('gamma');
ylabel('function value');
title('Steve Macenski');
grid on;
    
%As seen by the outputs of tic and toc, the bisection method takes .008685
%seconds, while the secant method only takes .001718 seconds to complete
%the same action to a similar tolerance when the tolerances are set to be
%the same. Computation time is correlated to number of iterations. 

    
    
    
    
    
    
    
    
    