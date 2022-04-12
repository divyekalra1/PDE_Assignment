clc;
close all;
clear all;
c = 1;
a = 1+2+9+1;
x = -13:0.5:13;
t = 0:0.5:10;
str = "c = " + string(c);

F1 = figure('Name',"D'Alembert's Solution",'NumberTitle','off');
F1.Position = [100 100 900 500];
subplot(2,2,1);
u = [];
for i = 1:length(t)
    f1(i,:) = a*((x+(c*t(i)))<(-a/2) & (x+(c*t(i)))>-a) + (a/2)*((x+(c*t(i)))>(-a/2) & (x+(c*t(i)))<(a/2)) + a*((x+(c*t(i)))>(a/2) & (x+(c*t(i)))<a) + 0;
    f2(i,:) = a*((x-(c*t(i)))<(-a/2) & (x-(c*t(i)))>-a) + (a/2)*((x-(c*t(i)))>(-a/2) & (x-(c*t(i)))<(a/2)) + a*((x-(c*t(i)))>(a/2) & (x-(c*t(i)))<a) + 0;
    u = [u ; 0.5*(f1(i,:)+f2(i,:))];
end
s = surf(x,t,u);
title(str);
xlabel("x axis")
ylabel("t axis")
zlabel("u = u(x,t)")
colorbar 

subplot(2,2,2);
s = contour(x,t,u);
title(str);
xlabel("x axis")
ylabel("t axis")

subplot(2,2,3:4);
h = animatedline;
view(3);
for i = 1:length(t)
    for j = 1:length(x)
    addpoints(h,x(j),t(i),u(i,j));
    drawnow
    end
end
xlabel("x axis")
ylabel("t axis")
zlabel("u = u(x,t)")

F2 = figure('Name',"D'Alembert's Solution with Exchanged Initial Conditions",'NumberTitle','off');
F2.Position = [600 100 900 500];
subplot(2,2,1);
u = [];

for i = 1:length(t)
    g(i,:) = 2*a*c*t(i)*((x+(c*t(i)))<(-a/2) & (x+(c*t(i)))>-a) + 2*(a/2)*c*t(i)*((x+(c*t(i)))>(-a/2) & (x+(c*t(i)))<(a/2)) + 2*a*c*t(i)*((x+(c*t(i)))>(a/2) & (x+(c*t(i)))<a) + 0;
    u = [u ; g(i,:)];
end
s = surf(x,t,u);
title(str);
xlabel("x axis")
ylabel("t axis")
zlabel("u = u(x,t)")
colorbar

subplot(2,2,2);
s = contour(x,t,u);
title(str);
xlabel("x axis")
ylabel("t axis")

subplot(2,2,3:4);
h = animatedline;
view(3);
for i = 1:length(t)
    for j = 1:length(x)
    addpoints(h,x(j),t(i),u(i,j));
    drawnow
    end
end
xlabel("x axis")
ylabel("t axis")
zlabel("u = u(x,t)")