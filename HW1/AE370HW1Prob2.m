%Completed by Steven Macenski 
% AE 370 Homework 1 problem 2

%Setting Program resets and constants 
clear all
format long 
Approximate = 0;

%Loop to complete the summation and store values of pi in Approximate 
j = 0;
for i = 1:4000;     %For each i for the range iterate and add to Approximation in the 'ith' entry
    j = j + 1./((2.*i-1).^2*(2.*i+1).^2);
    Approximate(i) = sqrt(j*16+8);
end 

%Graph the data points 
t1 = linspace(1,20,1e4);
plot(1:20,Approximate(1:20),'.-',t1,pi); %Plot the approximation function for 1:20 as prompt asks 
Error = pi - Approximate;
x=find(Error<=10^-12); %Finds location of the error e-12, e-10, e-4 and stores the location in first entry
y =find(Error<=10^-8);
z = find(Error<=10^-4);
xlabel('x values')
ylabel('Approximation function');
title('Steve Macenski');
%Prints the first entry for each error in which they occur
fprintf('For accuracy of e-8 n = 174, for e-4 n = 8, for e-12 n = 3757 via find functions\n'); 