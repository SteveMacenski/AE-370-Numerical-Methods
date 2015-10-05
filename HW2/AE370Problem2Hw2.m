% AE 370 Completed by Steven Macenski HW 2 problem 2
clear all;clc;clf;

%Prompts user for inputs 
N = input('Input N between 1 and 5: ');
M = input('Input M larger than 1: ');
b = 20/M;
a = 0;
format long

%Checks user input for errors 
if N < 1 || N > 5;
    fprintf('Error, N not between 1 and 5 and integer');
end
if ceil(N) ~= floor(N)
    fprintf('Error, N not between 1 and 5 and integer');
end 
if ceil(M) ~= floor(M)
    fprintf('Error, M not integer');
end 
if M < 1
    fprintf('Error,M < 1');
end 

inte_tot = 0;
%While loops through each increment 
while b <= 20
    inte = 0;
    %Setting the Weights and points based off of the user input
    %Then going through the Gauss Quadrature 
    %For N is 1
    if N == 1;
        X = 0;
        W = 2;
        inte = ((b - a)/2).*W*y_func((((b-a)/2)*X)+((a+b)/2));
        
        %For N is 2
    elseif N == 2
        X = [sqrt(1/3) -sqrt(1/3)];
        W = 1;
        
        inte = ((b - a)/2).*W*y_func((((b-a)/2)*X(1))+((a+b)/2))+...
               ((b - a)/2).*W*y_func((((b-a)/2)*X(2))+((a+b)/2));
        % For N is 3
    elseif N == 3
        X = [0 sqrt(3/5) -sqrt(3/5)];
        W = [8/9 5/9 5/9];
        
        inte = ((b - a)/2).*W(1)*y_func((((b-a)/2)*X(1))+((a+b)/2))+...
               ((b - a)/2).*W(2)*y_func((((b-a)/2)*X(2))+((a+b)/2))+...
               ((b - a)/2).*W(3)*y_func((((b-a)/2)*X(3))+((a+b)/2));
        
           %For N is 4
    elseif N == 4
         X = [sqrt(3/7-2/7*sqrt(6/5)) -sqrt(3/7-2/7*sqrt(6/5)) sqrt(3/7+2/7*sqrt(6/5)) -sqrt(3/7+2/7*sqrt(6/5))];
         W = [(18+sqrt(30))/36 (18+sqrt(30))/36 (18-sqrt(30))/36 (18-sqrt(30))/36];
         
         inte = ((b - a)/2).*W(1)*y_func((((b-a)/2)*X(1))+((a+b)/2))+...
                ((b - a)/2).*W(2)*y_func((((b-a)/2)*X(2))+((a+b)/2))+...
                ((b - a)/2).*W(3)*y_func((((b-a)/2)*X(3))+((a+b)/2))+...
                ((b - a)/2).*W(4)*y_func((((b-a)/2)*X(4))+((a+b)/2));
            %For N is 5
    elseif N == 5
        X = [0 1/3*sqrt(5-2*sqrt(10/7)) -1/3*sqrt(5-2*sqrt(10/7)) 1/3*sqrt(5+2*sqrt(10/7)) -1/3*sqrt(5+2*sqrt(10/7))];
        W = [128/225 (322+13*sqrt(70))/900 (322+13*sqrt(70))/900 (322-13*sqrt(70))/900 (322-13*sqrt(70))/900];
        
        inte = ((b - a)/2).*W(1)*y_func((((b-a)/2)*X(1))+((a+b)/2))+...
               ((b - a)/2).*W(2)*y_func((((b-a)/2)*X(2))+((a+b)/2))+...
               ((b - a)/2).*W(3)*y_func((((b-a)/2)*X(3))+((a+b)/2))+...
               ((b - a)/2).*W(4)*y_func((((b-a)/2)*X(4))+((a+b)/2))+...
               ((b - a)/2).*W(5)*y_func((((b-a)/2)*X(5))+((a+b)/2));
    
    end 
    %Looping around adding to the a and bs and the calculated integration
    b = b + (20/M);
    a = a + (20/M);
    inte_tot = inte_tot + inte;

end

%Outputting to user
fprintf('integration: %f\n',inte_tot);

exact = (-10*(2+3*sqrt(2)))/(3*pi);
error = abs((inte_tot-exact)/(exact));
fprintf('Error:       %f\n',error);

%Calculating error and plotting 
ns = [1 2 3 4 5];
nsError = [.006836 .000017 2.9132e-8 .000000000002900 0];
Ms = [1 10 20 50 100 200 500 1000 5000];
MsError = 100.*[2.741316 9.900860 .064406 .000205 .000002 .0000000291469 .0000000001164 .000000000001816 1.68e-16];

%Plotting the errors 
figure(1)
loglog(ns,nsError,'o-');
xlabel('Ns');
ylabel('relative Error');
title('Steven Macenski');
figure(2)
loglog(Ms,MsError,'o-');
xlabel('Ms');
ylabel('relative Error');
title('Steven Macenski');

% The rates of convergance for a fixed M (200) and increasing N's is that
% the error decreases until N = 3 in which the error remains effective
% constant at .764366, which is where the error converges. For a fixed N
% (3) and increasing M subintervals, The error initially increases from M =
% 1 to 10, then decreases drastically until M = 100. When M = 200 the error
% increases back up to .7664366, then back to 0 for 500 and 1000. Error for
% 5000 is .055696 which can be attributed to the error in single precision.
% The convergance of this is expected for the middle terms of the M
% changes. The outliers are during the first few and last inputs. 






