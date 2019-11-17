l=input("Enter l of rectangle : ");
b=input("Enter b of rectangle : ");

base = input("enter base of triangle : ");
height= input("enter height of triangle : ");


x=l+b;

a=zeros(1,2);
c1=a;
c2=a;
c3=a;
c4=a;
t1=a;
t2=a;
t3=a;

disp("INPUT COORDINATES FOR RECTANGLE");
c1(1,1)=input("Enter x coordinate for point1:");
c1(1,2)=input("Enter y coordinate for point1:");

c2(1,1)=input("Enter x coordinate for point2:");
c2(1,2)=input("Enter y coordinate for point2:");

c3(1,1)=input("Enter x coordinate for point3:");
c3(1,2)=input("Enter y coordinate for point3:");

c4(1,1)=input("Enter x coordinate for point4:");
c4(1,2)=input("Enter y coordinate for point4:");

disp("INPUT COORDINATES FOR TRAINGLE SLOT");
t1(1,1)=input("Enter the x coordinate of point1:");
t1(1,2)=input("Enter the y coordinate of point1:");

t2(1,1)=input("Enter the x coordinate of point2:");
t2(1,2)=input("Enter the y coordinate of point2:");

t3(1,1)=input("Enter the x coordinate of point3:");
t3(1,2)=input("Enter the y coordinate of point3:");

flag=0;
//checking if input coordinate are valid

    d12=sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
    d23=sqrt((c3(1)-c2(1))^2 + (c3(2)-c2(2))^2);
    d34=sqrt((c3(1)-c4(1))^2 + (c3(2)-c4(2))^2);
    d14=sqrt((c3(1)-c4(1))^2 + (c1(2)-c4(2))^2);

    L=max([d12,d23,d34,d14]);
    B=min([d12,d23,d34,d14]);
    
    if(D==l and B==b)
        //finding the max x coordinate of rectangle
        p=abs(c2(1,1));
        r=abs(c3(1,1));
        mxr=max([p,r]);

        //finding the max y coordinate of rectangle
        q=abs(c1(1,2));
        s=abs(c2(1,2));
        myr=max([q,s]);
        
        //finding max x coordinate of triangle            
        u=abs(t1(1,1));
        v=abs(t2(1,1));
        w=abs(t3(1,1));

        mtx=max([u,v,w]);


if(flag==1)
    //finding centroid of rectangle
    m1=(c1+c2)/2 ;
    m2= (c3+c4)/2 ;
    cr = (m1+m2)/2;

    //finding centroid of triangle
    m12= (t1+t2)/2;
    m23 = (t2+t3)/2;
    m31= (t1+t3)/2;
    v1= t23-t1;
    v2= t31-t2;
    ct = intersect(v1,v2);
     
    //centroid of figure
    
