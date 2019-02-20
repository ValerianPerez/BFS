function g = blc(img)
  [n m] = size(img); 
  g= img;
  flt = logical([0 1 0;1 0 1;0 1 0]); 
  for i = 2:n-1
    for j=2:m-1
    mk = img(i-1:i+1,j-1:j+1)(flt);
    l  =abs(mk-img(i,j));
    [m id]= min(l); 
      if(m<=20)
        g(i,j)=max(mk(id),g(i,j));
        
      end
  
    
    end
  end
  
endfunction
