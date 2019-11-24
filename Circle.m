r = input(" enter the radius:");
d= 2*r;
a = zeros(1,2);
c=a;
c(1,1)=input("Enter the x coordinate of the cenet with respect to origin:");
c(1,2)=input("Enter the x coordinate of the cenet with respect to origin:");
A= pi*r*r;
centroid = c

disp("Moment of inertia alog centroidal axis:");
Ic1 = (pi*d*d*d*d)/64;
Ic = [Ic1 Ic1]

disp("Moment of Inertia along X-xis and Y-axis:");
I= Ic + A*c*c