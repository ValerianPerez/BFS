function [T T2 f] = cutcard(cd,coor)

  coor=uniq(coor); 
  [n t] = size(coor(coor(:,5)>0));  
  if(n>1) f = 0; else f =2; end 
  [v i] = max(coor(:,5)); 
  x1 = floor(coor(i,2))+1; 
  y1 =floor(coor(i,1))+1;
  a = floor(coor(i,4)); 
  b = floor(coor(i,3)); 
   coor(i,5)=0; 
  A = (cd(x1:x1+a,y1:y1+b,:));
  [v i] = max(coor(:,5)); 
  x2 = floor(coor(i,2))+1; 
  y2 =floor(coor(i,1))+1;
  a = floor(coor(i,4)); 
  b = floor(coor(i,3)); 
 B = (cd(x2:x2+a,y2:y2+b,:)); 
 if(x1<x2) T = A; T2=B; 
else T = B; T2 = A; 
 end 
 
  end 