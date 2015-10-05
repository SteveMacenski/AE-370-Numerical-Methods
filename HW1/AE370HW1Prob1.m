%Completed by Steven Macenski AE 370 Homework 1 

%Prompting user for inputs N1 & N2
N1 = input('Input N1');
N2 = input('Input N2');

% Finding the minimum of the two inputs for 'a' & finding N1+N2 for b
a = min(N1,N2);
b = N1 + N2; 
i = 0;
j = 0;
% % setting loop to complete actions desired
for i = a:b
    j = j+(1/(i.^2));
end 
 
%Print statements
fprintf('Lower bound of the series a = %f\n',a)
fprintf('Upper bound of the series b = %f\n',b)
fprintf('Computed function f(N1,N2) = %f\n',j)
