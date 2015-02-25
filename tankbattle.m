% This is Tankbattle by Alex Miller (2014) at UOIT

x=linspace(1,500,1000);  %x vector for our world
terrain=100*ones(1,1000); %initalize the terrain vector for the world
clf    %clear the graph
over=0;  %make a game over counter
fff=[2 3 3 4 5 5 5 5 4 3 3 2];   %%this is the terrain destruction vector from our bombs
mountains=1+2*rand;  %% variable for how mountainous the terrain will be
height=1+0.5*rand; %% variable for how high mountains will be

for i=1:1000
a=randn/10*height;
b=randn/40*mountains;
c=10;
d=randn/5;

terrain=(terrain+(a*sin(b*x+c))+d);  %%this generates random terrain with random fourier series of sin waves
  
end
figure(1);
h=area(terrain,'FaceColor',[0.55 0.7 0.6]);   %plot terrain
  hold on
axis([0 1000 terrain(1)-10 terrain(1)+20]) %scale our plot

x1=round(rand*480)+10;
y1=terrain(x1);   %%x and y point of Player1 tank


plot(x1,y1,'s','markerfacecolor',[1 1 0])

x2=round(rand*480)+510;
y2=terrain(x2);  %%x and y point of player2 (or computer ai) tank 

plot(x2,y2,'s','markerfacecolor',[0 1 1])

disp('Please put Figure 1 Window in full screne to play and click OK');
msgbox('Please put Figure 1 Window in full screne to play and click OK');
pause(6)

guys=inputdlg('How many players (1 or 2) ?  ');
players=guys{1};
players=str2num(players);

if players==1
    difficulty=inputdlg('what difficulty? 1=derp 2=easy 3=medium 4=hard 5=Damn-impossible : ');
    difficulty=difficulty{1};
    difficulty=str2num(difficulty);
end




while over<1  %%whole game while loop. Game over when over=1
    clc
    
pitch=inputdlg('Player 1 what pitch (angle) ?  ');  %%get player1 angle of projectile
    pitch=pitch{1};
    pitch=str2num(pitch);

power=inputdlg('Player 1 what power (1-100) ? ');  %%get player1 power of projectile
    power=power{1};
    power=str2num(power);
    
pitch=min(pitch,90);
power=min(power,100);
pitch=pitch/10+randn/20;  %%rescale angle to our world and add some randomness
power=30+4*power+randn*3; %%rescale power to our world and add some randomness

clc

    if players==2
        pitch2=inputdlg('Player 2 what pitch (angle) ?  ');
            pitch2=pitch2{1};
            pitch2=str2num(pitch2);
        power2=inputdlg('Player 2 what power (1-100) ? ');
            power2=power2{1};
            power2=str2num(power2);
            
        pitch2=min(pitch2,90);
        power2=min(power2,100);
        pitch2=pitch2/10+randn/20;
        power2=30+4*power2+randn*3;
    elseif difficulty==1
        pitch2=(90*rand)/10+randn/20;
        power2=30+4*(100*rand)+randn*3;
    elseif difficulty==2
        pitch2=pitch+randn/10;
        power2=power+(y1-y2)+5*randn;
    elseif difficulty==3
        power2=((-9.8*(x2-x1)^2)/(((y1-y2-(x2-x1)*sind(5)/cosd(5)))*cosd(5)^2))^0.5+randn*7;
        pitch2=5+randn*0.5;
    elseif difficulty==4
        power2=((-9.8*(x2-x1)^2)/(((y1-y2-(x2-x1)*sind(7)/cosd(7)))*cosd(7)^2))^0.5+randn*5;
        pitch2=7+randn*0.2;
    elseif difficulty==5
        power2=((-9.8*(x2-x1)^2)/(((y1-y2-(x2-x1)*sind(9)/cosd(9)))*cosd(9)^2))^0.5;
        pitch2=9;
end

vx=power*cosd(pitch);
vy=power*sind(pitch);

vx2=power2*cosd(pitch2);
vy2=power2*sind(pitch2);


xray=x1:(1000);
xray2=x2:-1:1;

parabolax=xray-x1;
parabolax2=xray2-x2;
parabolay=-9.8*(parabolax/vx).^2+vy*(parabolax/vx)+y1;
parabolay2=-9.8*(-parabolax2/vx2).^2+vy2*(-parabolax2/vx2)+y2;

bullet=[xray(1),parabolay(1)];
bullet2=[xray2(1),parabolay2(1)];

                    for i=1:2:length(xray)

                    bullet=[xray(i),parabolay(i)];
                    figure(1)
                    h=plot(bullet(1),bullet(2),'.','color',[0 0 0]);
                    pause(0.0000001)
                        if parabolay(i)<terrain(i+x1-1)&&i>10 && (i+x1-1)<993
                            for z=1:100
                                pause(0.00001)
                                plot(bullet(1)+randn*4,bullet(2)+randn/7,'*','color',[0.5+rand/2 0 0])
                                
                            end

                           
                           for q=1:12
                               terrain(xray(i-6+q))=terrain(xray(i-6+q))-rand*fff(q)/5;
                               y1=terrain(x1);
                               y2=terrain(x2);
                           end
                           
                                                                                clf
                                        h=area(terrain,'FaceColor',[0.55 0.7 0.6]);

                                          hold on
                                        axis([0 1000 terrain(1)-10 terrain(1)+20])

                                        plot(x1,y1,'s','markerfacecolor',[1 1 0])

                                        plot(x2,y2,'s','markerfacecolor',[0 1 1])
                                        
                               break
                        end
                        delete(h)
                    end
                        
                    for i=1:2:length(xray2)
 
                                bullet2=[xray2(i),parabolay2(i)];
                                figure(1)
                                h=plot(bullet2(1),bullet2(2),'.','color',[0 0 0]);
                                pause(0.0000001)
                                    if parabolay2(i)<terrain(x2-i+1)&&i>10 && (x2-i+1)>7

                                            for z=1:100
                                                pause(0.00001)
                                                
                                                plot(bullet2(1)+randn*4,bullet2(2)+randn/7,'*','color',[0.5+rand/2 0 0])
                                            end
                                        
                                        for q=1:12
                                            terrain(xray2(i-6+q))=terrain(xray2(i-6+q))-rand*fff(q)/5;
                                            y1=terrain(x1);
                                            y2=terrain(x2);         
                                        end
                                        
                                                                                clf
                                        h=area(terrain,'FaceColor',[0.55 0.7 0.6]);

                                          hold on
                                        axis([0 1000 terrain(1)-10 terrain(1)+20])

                                        plot(x1,y1,'s','markerfacecolor',[1 1 0])

                                        plot(x2,y2,'s','markerfacecolor',[0 1 1])
                                        
                                        break
                                    end
                                    delete(h)
                    end


clf
h=area(terrain,'FaceColor',[0.55 0.7 0.6]);

  hold on
axis([0 1000 terrain(1)-10 terrain(1)+20])

plot(x1,y1,'s','markerfacecolor',[1 1 0])

plot(x2,y2,'s','markerfacecolor',[0 1 1])

% for z=1:100
%     pause(0.00001)
%     plot(bullet(1)+randn*4,bullet(2)+randn/7,'*','color',[0.5+rand/2 0 0])
%     plot(bullet2(1)+randn*4,bullet2(2)+randn/7,'*','color',[0.5+rand/2 0 0])
% end

        if abs(bullet(1)-x2)<5 && abs(bullet(2)-y2)<2
            disp('WOW YOU Player 1 YOU WIN!!!!!!!!!!!!!!!')
            over=1;
            for z=1:100
                                pause(0.00001)
                                plot(x2+randn*4,y2+randn/7,'*','color',[0.5+rand/2 0 0])
                             
            end
            clf
                    h=area(terrain,'FaceColor',[0.55 0.7 0.6]);

                      hold on
                    axis([0 1000 terrain(1)-10 terrain(1)+20])

                    plot(x1,terrain(x1),'s','markerfacecolor',[1 1 0])

                    plot(x2,terrain(x2),'s','markerfacecolor',[0 1 1])
                        for z=1:600
                        figure(1)
                        plot(x2+randn*4*z/100,y2+z/100+randn/5,'*','color',[(z+99)/700 (z+99)/700 (z+99)/700])
                        end
            break
        end

          if abs(bullet2(1)-x1)<5 && abs(bullet2(2)-y1)<2
            disp('WOW PLAYER 2 YOU WIN !!!!!!!!!!!!!!!')
            over=1;
             for z=1:100
                                pause(0.00001)
                                plot(x1+randn*4,y1+randn/7,'*','color',[0.5+rand/2 0 0])
                             
            end
            
            clf
                        h=area(terrain,'FaceColor',[0.55 0.7 0.6]);

                          hold on
                        axis([0 1000 terrain(1)-10 terrain(1)+20])

                        plot(x1,terrain(x1),'s','markerfacecolor',[1 1 0])

                        plot(x2,terrain(x2),'s','markerfacecolor',[0 1 1])
            
                        for z=1:600
                        figure(1)
                        plot(x1+randn*4*z/100,y1+z/100+randn/5,'*','color',[(z+55)/700 (z+55)/700 (z+55)/700])
                        end
            break
          end
        
clf
h=area(terrain,'FaceColor',[0.55 0.7 0.6]);

  hold on
axis([0 1000 terrain(1)-10 terrain(1)+20])

plot(x1,terrain(x1),'s','markerfacecolor',[1 1 0])

plot(x2,terrain(x2),'s','markerfacecolor',[0 1 1])

end

  msgbox('GAME OVER')
