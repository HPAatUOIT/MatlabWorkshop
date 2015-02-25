clf
ground=[1:1000];
hills=100*sind(ground);

plot(ground,hills,'color',[0 1 0])


axis([0 1000 -100 500])

hold on

plot(90,100,'O','color','r')   %our tank
plot(360+90,100,'O')           %enemy tank

v=input('projectile velocity  :');  %input projectile velocity

%we will fire at 45 degrees for simplicity

vx=v*cosd(45);   %x component
vy=v*sind(45);   %y component 

                %P=[-9.8/2 vy 100];

                % time= roots(P);
                % 
                % if time(1)>0
                %  time_of_flight=time(1)
                % else
                %   time_of_flight=time(2) 
                % end
                
time_of_flight=2*9.8/vy; % time of flight for projectile

Range = vx*time_of_flight; %range is vx * time of flight. Vx is vo cos(theta)

%to plot the trajectory we must put x into y(t) to get a function y(x)
% x = vx * t  so  we can put x/vx for t 

x=linspace(0,1000,200);  %this gives the x vector to plot from 0 to the landing point

y=[-9.8/2*(x/vx).^2 + vy*(x/vx)+100]; % this is the y vector from the function y(x)

xmove=linspace(90,1090,200); %lets shift our x vector since our tank is at x=90 and not x=0

for i=1:200
    figure(1)
plot(xmove(i),y(i),'.','color',[0 0 0]);  %plots the projectile
end

