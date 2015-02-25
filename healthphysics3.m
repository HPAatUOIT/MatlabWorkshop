clf

iterations=10000;  %how many points to use. More points means more accuracy
count=0; %count up how many points are in our circle

for z=1:iterations
x=2*rand-1;   %x point
y=2*rand-1;   %y point

if x^2+y^2<1   %if we hit in the circle
    plot(x,y,'*','color','r')  %plot red point in circle
    count=count+1; %count up how many in circle hits we get
else 
    plot(x,y,'*')  %plot blue points outside circle
end
hold on 
end
axis([-2 2 -2 2])

piguy=4*count/iterations;  %our in circle hit ratio is pi/4 so multiply our hits by 4 to estimate pi

disp('pi is approximately')
piguy
