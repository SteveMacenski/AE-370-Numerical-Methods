%Completed by Steven Macenski
% AE 370 Problem 3 homework 1
%Setting program resets
clear all
clc
format long

%Loop to find the summation values for each X
x = linspace(-1,1,200);
j = 0;
for k = 1:length(x)
    Macluaren(1,k) = 1;     %For each, first iteration is = 1 since n=0
    for i = 2:200;          %Iterate through range of 200 iterations for each of the -1 through 1 range
    Macluaren(i,k) = Macluaren(i-1,k) + (((-1)^(i-1)*factorial(2*(i-1)))./((1-2*(i-1))*(factorial(i-1).^2)*(4.^(i-1))))*(x(k)^(i-1));
    % Adds the entry from last iteration to the iteration currently to add
    end
end 
%Plotting only the 20th iteration since it itself is the summation 
figure(1)
plot(x,sqrt(1+x), x, Macluaren(20,:));
xlabel('x')
ylabel('f(x)')
title('Steve Macenski')

range = logspace(-2,-12); %Logspace range
Nterms = [1,length(range)];
fake = (((-1)^(i-1)*factorial(2*(i-1)))./((1-2*(i-1))*(factorial(i-1).^2)*(4.^(i-1))))*(x(k)^(i-1));
    for j = 1:length(range) 
        i=0;        %Resets variables for each range
        fake = 0;
        N = 0;
        while abs(sqrt(1.5)-fake) > range(j);
            N = N + 1; %Adds an N to be written into the Nterms array
            fake = fake + (((-1)^(i)*factorial(2*(i)))./((1-2*(i))*(factorial(i).^2)*(4.^(i))))*(.5^(i)); %adds
            i = i + 1; %Adds i to continue while loop 
        end
        Nterms(j)=N;
    end  
            
figure(2) 
%Plots the range by the Nterms 
semilogx(range,Nterms);
xlabel('error range');
ylabel('N terms');
title('Steve Macenski');


