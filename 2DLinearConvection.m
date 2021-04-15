clc; clear all;
Nx=61;          %number of points in x
Ny=61;          %number of points in x
Nt=61;          %number of time steps
c=1;            
dx=(4/(Nx-1)); 
dy=(4/(Ny-1));
dt=0.01;
x=0:dx:4;
y=0:dy:4;
CFL=c*dt/dx;
for i =1:Nx;
    for j=1:Ny;
         if (1<=x(i) && x(i)<=2) && (1<=y(j) && y(j)<=2)
             u(i,j) = 1;
         else 
             u(i,j) = 0;

         end
    end
end
i=2:Nx-1 ;       
j=2:Nx-1;
for t = 0:Nt
    un=u;
    u(i,j)=un(i,j)-c*dt/dx*(un(i,j)-un(i-1,j))-c*dt/dy*(un(i,j)-un(i,j-1));

figure(1)
colormap jet
surf(x,y,u,'FaceColor','interp', 'EdgeColor','none','FaceLighting','gouraud')
view(-61,61)
camlight('right')
title({['2-D Linear Convection Eq.  ',' @CFL  = ',num2str(CFL)];['Time(s) = ',num2str(dt*t)]})
zlabel('Transported quantity u profile \rightarrow')
grid on;
drawnow;
end
