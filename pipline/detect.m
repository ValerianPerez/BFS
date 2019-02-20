function [t1 t2] = detect(cd)
f = 1;  
t1=0;
t2=0;
while(f>=1) 
bcd = tobinary(cd,f); 
%figure(); 
%imshow(bcd);
%imwrite(bcd,'./debug/binary.png'); 
[ecd stats] = edges(bcd,false); 
[t1 t2 f] =cutcard(cd,ecd); 
##f
##figure()
##subplot(2,1,1)
##imshow(t1); 
##subplot(2,1,2)
##imshow(t2); 
end


 end  