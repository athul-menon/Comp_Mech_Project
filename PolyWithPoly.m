n = "Enter the number of points for figure:";
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
 
%   SLOT
n = "Enter the number of sides for slot:";
N = input(n);
A= zeros(1,N);
p=zeros(1,N);
q=zeros(1,N);
x=A;
y=A;
for s=1:N
   B ="Enter x coordinate:";
   C ="Enter y coordinate";
   b= input(B);
   c= input(C);
   p(1,s)= b;
   q(1,s)= c;
end   


% check if inputs are same size
if ~isequal( size(p), size(q) )
  error( 'P and Q must be the same size');
end

flag=1;
% TO CHECK IF SLOT IS INSIDE:
    for s=1:N
        in=inpolygon(p(1,s),q(1,s),x,y);
        if(~in)
            flag=2;
            disp("slot outside fiigure");
            break;
        end
    end
% temporarily shift data to mean of vertices for improved accuracy
pm = mean(x);
qm = mean(y);
p = p - pm;
q = q - qm;

% summations for CCW boundary
pp = p( [2:end 1] );
qp = q( [2:end 1] );
b = p.*qp - pp.*q;
 
B = sum( b ) /2;
pc = sum( (p+pp).*b  ) /6/B;
qc = sum( (q+qp).*b  ) /6/B;
Ipx = sum( (q.*q +q.*qp + qp.*qp).*b  ) /12;
Iqy = sum( (p.*p +p.*pp + pp.*pp).*b  ) /12;
 
% centroidal moments
Ipu = Ipx - B*qc*qc;
Iqv = Iqy - B*pc*pc;
 
% replace mean of vertices
p_cen = pc + pm;
q_cen = qc + qm;
Ipx = Ipu + B*q_cen*q_cen;
Ipy = Iqv + B*p_cen*p_cen;
 
%To Find Centroid of the figure
if(flag==1)
	cx=((A*x_cen)-(B*p_cen))/(A-B);
	cy=((A*y_cen)-(B*q_cen))/(A-B);	
end
%To Find Moment of the figure  
if(flag==1)
	dx=cx-x_cen;
	dy=cy-y_cen;
	dsx=cx-p_cen;
	dsy=cy-q_cen;	Icx =(Iuu-Ipu)-(A*dx*dx)-(B*dsx*dsx);
	Icy =(Ivv-Iqv)-(A*dy*dy)-(B*dsy*dsy);
end
% return values
disp("Centroid point:");
Centroid =[cx cy]
disp("Moment of enertia on Centroidal Axis:");
Ic = [Icx Icy]
