n = "Enter the number of sides:";
N = input(n);
A= zeros(1,N);
x=A;
y=A;
for s=1:N
   B ="Enter x coordinate:";
   C ="Enter y coordinate";
   b= input(B);
   c= input(C);
   x(1,s)= b;
   y(1,s)= c;
end
    
% check if inputs are same size
if ~isequal( size(x), size(y) )
  error( 'X and Y must be the same size');
end
 
% temporarily shift data to mean of vertices for improved accuracy
xm = mean(x);
ym = mean(y);
x = x - xm;
y = y - ym;
  
% summations for CCW boundary
xp = x( [2:end 1] );
yp = y( [2:end 1] );
a = x.*yp - xp.*y;
 
A = sum( a ) /2;
xc = sum( (x+xp).*a  ) /6/A;
yc = sum( (y+yp).*a  ) /6/A;
Ixx = sum( (y.*y +y.*yp + yp.*yp).*a  ) /12;
Iyy = sum( (x.*x +x.*xp + xp.*xp).*a  ) /12;
 
% centroidal moments
Iuu = Ixx - A*yc*yc;
Ivv = Iyy - A*xc*xc;
 
% replace mean of vertices
x_cen = xc + xm;
y_cen = yc + ym;
Ixx = Iuu + A*y_cen*y_cen;
Iyy = Ivv + A*x_cen*x_cen;
 

% return values
disp("Centroid point:");
Centroid = [x_cen  y_cen]
disp("Moment of Inertia on X axis and  Y axis:");
I = [Ixx Iyy]
disp("Moment of inertia on Centroidal Axis:");
Ic = [Iuu Ivv]

%For the circular hole
r=input("Enter the radius of the hole:");
areaCir= (pi*((r)^2))
a=zeros(1,2);
c=a;
c(1,1)=input("Enter the x coordinate of the center of hole:");
c(1,2)=input("Enter the y coordinate of the center of hole:");
centroidCir = c
ICir=(5*pi*(r^4))/4

%to find the real centroid
Rcen=((A*Centroid)-(areaCir*centroidCir))/(A-areaCir)
drx =[Centroid;Rcen];
drx = pdist(drx,'euclidean')

dcx=[centroidCir;Rcen];
dcx = pdist(dcx,'euclidean')

MIX=Ixx-ICir+(A*dcx^2)-(areaCir*dcx^2)
MIY=Iyy-iCir+(A*dcx^2)-(areaCir*dcx^2)


