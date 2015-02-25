% Created for Health Physics Association at UOIT MATLAB workshop by Alex Miller 
% Feb 2014
clf
position=[500 500];

angle1=45; %%% atand(500/500);  %at origin
angle2=49; %%%atand(500/450); %300 m down the street
angle3=51; %%%atand(500/400); %600 m down street

m1=tand(angle1);
m2=tand(angle2);
m3=tand(angle3);

b1=0-m1*0;
b2=0-m2*50;
b3=0-m3*100;

A=[1 -m1;1 -m2];
b=[b1;b2];

C=[1 -m1;1 -m2;1 -m3];
d=[b1;b2;b3];

pos=C\d;

x=[0:1000];

line1=m1*x+b1;
line2=m2*x+b2;
line3=m3*x+b3;

plot(x,line1)
axis([0 1000 0 1000])
hold on
plot(x,line2,'color',[0 1 0])
plot(x,line3,'color',[0 0 0])

plot(pos(1,1),pos(2,1),'*','color','r')

plot(500,500,'O','color',[0 0 0])






