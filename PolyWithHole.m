
n = "Enter the number of sides:";
N = input(n);
F= zeros(1,N);
X=F;
Y=F;

for s=1:N
   B ="Enter x coordinate:";
   C ="Enter y coordinate";
   b= input(B);
   c= input(C);
   X(1,s)= b;
   Y(1,s)= c;
end

    

% check if inputs are same size

if ~isequal( size(x), size(y) )
  error( 'X and Y must be the same size');

end

 

% temporarily shift data to mean of vertices for improved accuracy

xm = mean(X);
ym = mean(Y);
x = X - xm;
y = Y - ym;
  

% summations for CCW boundary

xp = x( [2:end 1] );
yp = y( [2:end 1] );
a = x.*yp - xp.*y;
A = sum( a ) /2;
xc = sum( (x+xp).*a  ) /6/A;
yc = sum( (y+yp).*a  ) /6/A;
Ixx = (sum( (y.*y +y.*yp + yp.*yp).*a  ) /12)*(-1);
Iyy = (sum( (x.*x +x.*xp + xp.*xp).*a  ) /12)*(-1);

 

% centroidal moments

Iuu = Ixx - A*yc*yc;
Ivv = Iyy - A*xc*xc;

% replace mean of vertices

x_cen = xc + xm;
y_cen = yc + ym;
Ixx = (Iuu + A*y_cen*y_cen)*(-1);
Iyy = (Ivv + A*x_cen*x_cen)*(-1);
 

 

%For the circular hole

r=input("Enter the radius of the hole:");
areaCir= (pi*((r)^2))
cx=input("Enter the x coordinate of the center of hole:");
cy=input("Enter the y coordinate of the center of hole:");
centroidCir = [cx cy];
Icir=(5*pi*(r^4))/4;

 

 

%Verification whether the slot is inside

t=0;
for s=1:N
    d = sqrt((X(s)-cx)^2+(Y(s)-cy)^2);
    if (d>r)
        t = t+1;
    else
        disp("hole is outside");
        break
    end
end

 E = A-Ac;

if(t == N)
    Cex = ((A*x_cen-Ac*cx)/A-Ac);
    Cey = ((A*y_cen-Ac*cy)/A-Ac);
    dcx = (Cex - cx);
    dcy = (Cey - cy);
    drx = (Cex - x_cen);
    dry = (Cey - y_cen);
    MIX=Iuu-Icir+(A*drx*drx)-(areaCir*dcx*dcx);
    MIY=Ivv-Icir+(A*dry*dry)-(areaCir*dcy*dcy);
    Ixx = MIX+ E*(Cex*Cex);
    Iyy = MIY+ E*(Cey*Cey);
 
% return values

   disp("Centroid point:");
   Centroid = [Cex  Cey]
   disp("Moment of inertia on Centroidal Axis:");
   Ic = [MIX MIY]
   disp("Moment of inertia along X-axis and Y-axis:");
   I = [ Ixx  Iyy]
 
end
