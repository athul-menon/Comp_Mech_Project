%finding centroid and moment of inertia of circle

r=input("Enter the radius of the Circle:");
areaCir= (pi*((r)^2));
cx=input("Enter the x coordinate of the center of hole:");
cy=input("Enter the y coordinate of the center of hole:");
centroidCir = [cx cy];
tp=cy+r;
rp=cx+r;
lp=cx-r;
bp=cy-r;

q=[cx lp rp];
w=[tp cy cy];
Icir=(5*pi*(r^4))/4;



%finding centroid and moment of inertia of polygonal slot
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

if ~isequal( size(X), size(Y) )
  error('X and Y must be the same size');
end
% temporarily shift data to mean of vertices for improved accuracy
xm = mean(X);
ym = mean(Y);
x = X - xm;
y = Y - ym;
%check if slot is inside circle
counter=0;
flg=0;
for s=1:N
    re=iscircle(q,w,X(1,s),Y(1,s));
    if(re==-1)
        counter=counter+1;
    end
end
if(counter==N)
    flg=1;
end
if(flg==1)
% summations for CCW boundary
xp = x([2:end 1]);
yp = y([2:end 1]);
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


%finding centroid of figure
Centroidx=(cx*areaCir-x_cen*A)/(areaCir-x_cen);
Centroidy=(cy*areaCir-y_cen*A)/(areaCir-y_cen);
disp("centroid of given figure");
C=[Centroidx Centroidy]
dcx=Centroidx-cx;
dcy=Centroidy-cy;
dpx=Centroidx-x_cen;
dpy=Centroidy-y_cen;

%finding mi of figure

mix=Icir-Iuu + areaCir*dcx*dcx - A*dpx*dpx;
miy=Icir-Ivv + areaCir*dcy*dcy - A*dpy*dpy;
disp("MI ALONG  centroidal axis");
Ic=[mix miy]

E=areaCir -A;
%along x and y axes

Ixx=mix + E*Centroidx*Centroidx;
Iyy=miy + E*Centroidy*Centroidy;
disp("MI ALONG X AND Y AXIS");
Ii=[Ixx Iyy]
end
function result=iscircle(lol1,lol2,a,b)
    x1=lol1(1);y1=lol2(1);
    x2=lol1(2);y2=lol2(2);
    x3=lol1(3);y3=lol2(3);
    k=((x1-x2)*(x2*x2-x3*x3+y2*y2-y3*y3)-(x2-x3)*(x1*x1-x2*x2+y1*y1-y2*y2))/((2)*((y2-y3)*(x1-x2)-(y1-y2)*(x2-x3)));
    
    h=((y1-y2)*(y1+y2-2*k))/((2)*(x1-x2))+(x1+x2)/2;
    
    r=sqrt((x3-h)*(x3-h)+(y3-k)*(y3-k));
    
    val=(a-h)*(a-h)+(b-k)*(b-k)-r*r;
    
    result=sign(val);
    if(result==1)
        disp("invalid");
    end
    
end

