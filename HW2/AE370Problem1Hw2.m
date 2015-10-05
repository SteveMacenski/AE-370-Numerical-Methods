%Created By Steven Macenski for AE 370 HW 2 Problem 1
clc;clear all;clf

%Loading data
data = load('HW2_data_set');
%Prompt user for number of iterations it should display
N = input('Input the order desired: ')+1;

%Checks validity of the inputs requested to be an integer between 0-10
if floor(N) ~= ceil(N);
    fprintf('Error, is not integer\n');
    break
end
if N <1 || N > 11;
    fprintf('Error, is not between 0 and 10\n');
    break
end 
%Sets the data in their X and Y vectors 
X = data(:,1);
Y = data(:,2);

%Defines the N vector, from inputs and 1,4,7. Displays as 2,5,8 because the
%order is the term + 1 because of the ao part
N2 = [N,2,5,8];

i = 1;
j = 1;
k = 1;
%While loops around the 4 different N values and plots 
while k<=4;
    clear x;clear y, clear Sx, clear Sy, clear Amat
    %Clears after each loop
    N = N2(k);    
    Sx(1,1) = N;
    %Creates the A matrix of values and the C matrix
    for i = 1:length(1:N);
        for j = 1:length(1:N);
                Sx(i,j) = sum((X.^(i-1)).*(X.^(j-1)));
                Sy(i,1) = sum((X.^(i-1)).*(Y.^(1)));
        end
    end
    %Finds the a's for the matrix
    Amat = Sx\Sy;
    %Adds zeros so when plotting the extra terms go to 0
    Amat = [Amat; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];

    scatter(X,Y);
    %Plot points 
    color = ['r' 'g' 'b' 'c'];
    hold on
    grid on
    x = linspace(0,10);
    y = Amat(1,1)+Amat(2,1)*x+Amat(3,1)*x.^2+Amat(4,1)*x.^3+Amat(5,1)*x.^4+Amat(6,1)*x.^5+Amat(7,1)*x.^6+Amat(8,1)*x.^7+Amat(9,1)*x.^8+Amat(10,1)*x.^9+Amat(11,1)*x.^10;
    plot(x,y,color(k));
    title('Steven Macenski');
    %Plot the function for the polynomial
 
    if k == 1
        Amat
    end
    %displays the N value coefficients 
    k = k + 1;
    %Continues the loop
end

%The least square fit behaviour as N increases is that the fit goes through
%more of the points until the order is equal to the number of points.
%Increasing the order does NOT necessarily make a better fit for the curve,
%just because it goes through more of the points, does not mean it
%describes the trend well. Matlab gives an error saying that results may be
%inaccurate due to matrix is close to singular or badly scaled for higher
%values of N starting at N = 10. This is because the order is now equal to
%the number of data points in the data array. 

