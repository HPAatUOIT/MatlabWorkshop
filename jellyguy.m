% plots a 3d jellyfish with n tentacles each of length l. Input the number of tentacles and the length.
n=input('how many tenticles ? : ');
length = input('how long are the tenticles ? : ');
clf 
set(gcf,'color','white','name','and a jellyfish...')
    for k=1:ceil(n/3)
        fastthreedrandomize([-1.8-0.8*rand -1.8-0.8*rand -1.8-rand/3],ceil(1.2*length))
     hold on 
     % this creates 1/3 of the tentacles with a slightly longer length
    end
    for l=1:ceil(2*n/3)
        fastthreedrandomize([-1.8-0.8*rand -1.8-0.8*rand -1.8-rand/3],round(length))
        % creates 2/3 of the tentacles with given length
    end
    
    for m=1:ceil(n/3)
        fastthreedrandomize([-1.8-rand/3 -1.8-rand/3 -1.8-rand/3],round(length*0.8))
        % creates 1/3 of the tentacles with a slightly shorter length
    end
a=[-2.1 -1.9 -1.7 -1.65 -1.7 -1.9 -2.1 -2]-0.3*ones(1,8);
% this is a vector of the x coordinates of the round organells under the
% jellyfish body

b=[-1.8 -2.2 -2.2 -2 -1.75 -1.6 -1.6 -2]-0.3*ones(1,8);
% this is a vector of the y coordinates of the round organells under the
% jellyfish body

c=-1.9*ones(1,8);
% this is a vector of the z coordinates of the round organells under the
% jellyfish body

plot3([a],[b],[c],'o','color',[.4 .6 .72]) % plots a ring of organs in jellyfish body

[x y z] = sphere; %this is the matrix for the main sphere that will form the jellyfish body

r=rand(21,21); % this matrix is used to give the jellyfish body some organic variance or make it "wobbly" 

h= z.^4+z.^2+z+0.1*x+0.32*y+0.1*r; % warps the sphere to jellyfish body shape

surface(0.01*x,0.01*y,0.01*z+1) % this is an unessary point above the jellyfish used to ensure the jellyfish 
%is blue because matlab colorizes surface based on z range
%You could ignore this completely and have a red jellyfish. You could also simply change
%colour in the graph options if you want or use colour commands.  

surface(1.15*x-2.2,1.16*y-2.2,0.5*h-2.2+0.002*r,'FaceAlpha',0.7,'EdgeAlpha',0,'FaceLighting','phong') %plots the jellyfish body 

axis([-7 0 -7 0 -11 0]) %sets the axis to give a good view of the jellyfish



