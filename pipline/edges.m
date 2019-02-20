function [coor,stats] = edges(img, debug)
[n m] = size(img); 
SS = n*m; 
bw = im2bw(img);
% find both black and white regions
stats = [regionprops(bw); regionprops(not(bw))];  
% show the image and draw the detected rectangles on it
%imshow(bw); 
##hold on;
did =0; 
first = 0;
coor =zeros(1,5); 
for i = 1:numel(stats)
    a =round(stats(i).BoundingBox(3));
   b =round(stats(i).BoundingBox(4));
    f = a*b*100/SS;

  if(f>99 && debug) 
   
    c='r';
    l ='--';
       rectangle('Position', stats(i).BoundingBox, ...
    'Linewidth', 3, 'EdgeColor', c, 'LineStyle', l);
 
  
   elseif(f<93 && f>78) 
      c='r';
    l ='--';
       rectangle('Position', stats(i).BoundingBox, ...
    'Linewidth', 3, 'EdgeColor', c, 'LineStyle', l);
    elseif(f<10 && f>3 && a>3*b) 
      did=did+1; 
      c ='b';
       l ='-';
      if(first==1)c='g'; end
       if(first==2)c='y'; l='--'; end
      
     first = first +1;  
   coor(did,1:4) = stats(i).BoundingBox; 
   coor(did,5) = f; 
     rectangle('Position', stats(i).BoundingBox, ...
    'Linewidth', 3, 'EdgeColor', c, 'LineStyle', l);
     elseif(f<42 && f>35 ) 
      
      c ='y';
    l ='-';
       rectangle('Position', stats(i).BoundingBox, ...
    'Linewidth', 3, 'EdgeColor', c, 'LineStyle', l);

  end 
  
    
   
  
      
      
   
end
  
end
