function y = sharping(x)
 ma= max(x(:));
  s = ma -150; 
  y = x-s; 
  m = ma-s; 
  f = 255/m; 
  y=y*f; 
  
endfunction
