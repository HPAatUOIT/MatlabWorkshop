function[]=fastthreedrandomize(pos,iterations)
%creates connected vectors with randomized direction and colour that
%depends on position. These are the tenticles

    for i=iterations:-1:1 %this loop goes through making and plotting each tenticle segment 
        
        next = pos - [0.2*rand+(1.2/(iterations))*rand,0.2*rand+(1.2/(iterations))*rand,rand];
        % next determines the position of the next tenticle segment to plot
        
        q=[(1-abs(1/((pos(1)^1.5)))),(1-abs(1/((pos(1)*pos(2))))),1-abs(1/(pos(1)*pos(2)^1.5))]; 
        % q is the [r g b] colour vector for the iteration. This makes the vectors change colour with depth to give the appearance of light 
        %and a fading effect

        
        plot3([pos(1) next(1)],[pos(2) next(2)],[pos(3) next(3)],'color',q);
        % this plots the vector for the current tenticle segement 
        
        pos = next;
        %this sets the position to the end of the current tenticle segement, which
        %will be the beginning of the next tenticle segment
    end
end
   