% help for AE 370 Problem 3 HW 5 Steve Macenski 

%Taking constants 
k = 10;
A = 2;

%Taking in the coordinates 
xa = 0
ya = 2

xb = 2
yb = 2

xc = 0
yc = 4

% Finding the a1-c3 constants for work to be complete
a1 = xb*yc - xc*yb;
a2 = xc*ya - xa*yc;
a3 = xa*yb - xb*ya;
a = [a1 a2 a3];

b1 = yb - yc;
b2 = yc - ya;
b3 = ya - yb;
b = [b1 b2 b3];

c1 = xc - xb;
c2 = xa - xc;
c3 = xb - xa;
c = [c1 c2 c3];

coefmat = [a;b;c];

%Converting constants into useful matricies
for i = 1:3 %horizon
    for j = 1:3 %vertical
        kmat(j,i) = (b(i)*b(j) + c(i)*c(j));
    end 
end 
fprintf('Coef are:\n')
coefmat
fprintf('Local [k] is:\n')
kmat








