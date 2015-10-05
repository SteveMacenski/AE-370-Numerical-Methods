%AE 370 Completed by Steve Macenski HW 4 Problem 1 part 5

%Definitions 
L = 5;          %%%%%%%%%%%%%%% u(time,space) x1 x1 x1 x1 x1 x1 x1...
E = 70e9;                                    %x2 x2 x2 x2 x2 x2 x2...
rho = 2800;
sigma = 200e6;
N = 50;
deltax = L/N;
c = sqrt(E/rho);

%To get time step 1/2 of stability limit
deltat = sqrt(deltax^2/c^2)./2;

%make arrays for the time and space
t = 0:deltat:2.5*L/c;
x = 0:deltax:(L);

%Make empty vectors to fill for the displacement, velocity, and stress/E
dudx = zeros(length(t),N+1);
u = zeros(length(t),N+1);

for i = 2:length(t);
    for j = 2:1:N
        u(i+1,j) = 2*u(i,j) - u(i-1,j) + (deltat^2*c^2/deltax^2)*(u(i,j+1) - 2*u(i,j) + u(i,j-1));
         %Equation found in part 1 for all areas not on endpoints for u
    end
    j = N+1;
    u(i+1,j) = 2*u(i,j) - u(i-1,j) + (deltat^2*c^2/deltax^2)*((2*deltax*sigma/E) + u(i,N) - 2*u(i,j) + u(i,j-1));
        %ghost cell for the end conditions for all times for u

   for j = 2:1:N;
       dudx(i,j) = (u(i,j+1) - u(i,j-1))./(2*deltax);
        %Central diff for middle points for finding dudx 
   end 
   dudx(i,1) = (-u(i,3) + 4*u(i,2) -3*u(i,1))/(2*deltax);
        %forward diff for x=o for finding dudx
   dudx(i,N+1) = (3*u(i,N+1) - 4*u(i,N) + u(i,N-1))./(2*deltax);
        %backward diff for x = L for finding dudx 
   
   figure(1);
   plot(x,u(i,1:(N+1)));
   title('Steve Macenski - Displ');
   axis([0 5 0 .04])
        %plots the displacement 
   figure(2);
   plot(x,E*dudx(i,1:(N+1)));
   title('Steve Macenski - Stress');
   axis([0 5 0 6e8])
        %Plots the stress 
        
        pause
end 

for i = 2:length(t) 
    dudt(i) = (u(i+1,26) - u(i-1,26))./(2*deltat);
end 
dudt(1) = (-u(3,26) + 4*u(2,26) - 3*u(1,26))./(2*deltat);
dudt(N+1) = (3*u(N+1,26) - 4*u(N,26) + u(N-1,26))./(2*deltat);

%Plots the time evolution of stress and velocity over the middle of the bar
figure(3);
plot(t,smooth(E*dudx(1:251,26)));
title('Steve Macenski - Stress');
figure(4);
plot(t,smooth(dudt(1:251)));
title('Steve Macenski - Vel');




