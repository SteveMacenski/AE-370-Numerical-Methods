%AE 370 Completed by Steve Macenski HW 4 Problem 1 part 5

L = 5;          %%%%%%%%%%%%%%% u(time,space) x1 x1 x1 x1 x1 x1 x1...
E = 70e9;                                    %x2 x2 x2 x2 x2 x2 x2...
rho = 2800;
sigma = 200e6;
N = 50;
deltax = L/N;
c = sqrt(E/rho);

deltat = sqrt(deltax^2/c^2)./2;

t = 0:deltat:2.5*L/c;
x = 0:deltax:N;

u = zeros(length(t),N);



%IC / BC
u(:,1) = 0;
u(1,:) = 0;
%something du/dt(x,0)=0%

for i = 2:length(t);
    u(i,N) = u(i-1,N) + 2*deltax*sigma*1/E;
end 

for k = 2:length(t)-1;
    for j = 2:N-1;                                                %% when changing to value in 4 vs 2, no generate anything
        u(k+1,j) = 2*u(k,j) - u(k-1,j) + (deltat^2*c^2/deltax^2)*(u(k,j+1) - 2*u(k,j) + u(k,j-1));
    end 
end 

