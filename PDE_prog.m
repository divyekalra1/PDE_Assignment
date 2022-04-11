c = 1;
a = 1+2+9+1;
x = -20:.4:20;
t = 0:.4:20;

subplot(2,1,1);
u = [];
for i = 1:length(t)
    f1(i,:) = a*((x+(c*t(i)))<(-a/2) & (x+(c*t(i)))>-a) + (a/2)*((x+(c*t(i)))>(-a/2) & (x+(c*t(i)))<(a/2)) + a*((x+(c*t(i)))>(a/2) & (x+(c*t(i)))<a) + 0;
    f2(i,:) = a*((x-(c*t(i)))<(-a/2) & (x-(c*t(i)))>-a) + (a/2)*((x-(c*t(i)))>(-a/2) & (x-(c*t(i)))<(a/2)) + a*((x-(c*t(i)))>(a/2) & (x-(c*t(i)))<a) + 0;
    u = [u ; 0.5*(f1(i,:)+f2(i,:))];
end
s = surf(x,t,u);
colorbar

subplot(2,1,2);
h = animatedline;
view(3);
for i = 1:length(t)
    for j = 1:length(x)
    addpoints(h,x(j),t(i),u(i,j));
    drawnow
    end
end


