n = "Enter the number of points for figure:";
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
if ~isequal( size(X), size(Y) )
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
 
A = (sum( a ) /2)*-1;
xc = sum( (x+xp).*a  ) /6/A;
yc = sum( (y+yp).*a  ) /6/A;
Ixx = (sum( (y.*y +y.*yp + yp.*yp).*a  ) /12)*-1;
Iyy = (sum( (x.*x +x.*xp + xp.*xp).*a  ) /12)*-1;
 
% centroidal moments
Iuu = Ixx - A*yc*yc;
Ivv = Iyy - A*xc*xc;
 
% replace mean of vertices
x_cen = xc + xm;
y_cen = yc + ym;
Ixx = (Iuu + A*y_cen*y_cen)*-1;
Iyy = (Ivv + A*x_cen*x_cen)*-1;
 
%   SLOT
n = "Enter the number of sides for slot:";
N = input(n);
F= zeros(1,N);
P=F;
Q=F;
for s=1:N
   B ="Enter x coordinate:";
   C ="Enter y coordinate";
   b= input(B);
   c= input(C);
   P(1,s)= b;
   Q(1,s)= c;
end   


% check if inputs are same size
if ~isequal( size(P), size(Q) )
  error( 'P and Q must be the same size');
end

flag=1;
% TO CHECK IF SLOT IS INSIDE:
    for s=1:N
        in=inpolygon(P(1,s),Q(1,s),X,Y);
        if(~in)
            flag=2;
            disp("slot outside fiigure");
            break;
        end
    end
% temporarily shift data to mean of vertices for improved accuracy
pm = mean(P);
qm = mean(Q);
p = P - pm;
q = Q - qm;

% summations for CCW boundary
pp = p( [2:end 1] );
qp = q( [2:end 1] );
b = p.*qp - pp.*q;
 
B = (sum( b ) /2)*-1;
pc = sum( (p+pp).*b  ) /6/B;
qc = sum( (q+qp).*b  ) /6/B;
Ipx = (sum( (q.*q +q.*qp + qp.*qp).*b  ) /12)*-1;
Iqy = (sum( (p.*p +p.*pp + pp.*pp).*b  ) /12)*-1;
 
% centroidal moments
Ipu = Ipx - B*qc*qc;
Iqv = Iqy - B*pc*pc;
 
% replace mean of vertices
p_cen = pc + pm;
q_cen = qc + qm;
Ipx = (Ipu + B*q_cen*q_cen)*-1;
Ipy = (Iqv + B*p_cen*p_cen)*-1;
 

%To Find Centroid of the figure
if(flag==1)
	cx=((A*x_cen)-(B*p_cen))/(A-B)
	cy=((A*y_cen)-(B*q_cen))/(A-B)
end
%To Find Moment of the figure  
if(flag==1)
	dx=cx-x_cen;
	dy=cy-y_cen;
	dsx=cx-p_cen;
	dsy=cy-q_cen;	
    Icx =(Iuu-Ipu)+(A*dx*dx)-(B*dsx*dsx)
	Icy =(Ivv-Iqv)+(A*dy*dy)-(B*dsy*dsy)
end
