
function [X,Y] = CreataCirculatData(n,c,r)

     % n number of points that you want
     center = [c(1) ,c(2)]; % center coordinates of the circle [x0,y0] 
     radius = r; % radius of the circle
     angle = 2*pi*rand(n,1);
     r = radius*sqrt(rand(n,1));
     X = r.*cos(angle)+ center(1);
     Y = r.*sin(angle)+ center(2);
     
end