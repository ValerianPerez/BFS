function t= recongize(im)
sig = @(x) 1./(1+exp(-x));
A = @(w,a,b) sig(w*a+b); 
Ad = @(w,a) w*a;
load('network.mat'); 
X=28; 
tags = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'; 
size_im = size(im);  
R = max(size_im); 
size_im=size_im*X/R; 
im = abs(imresize(im,size_im));
im = resize(im,[X X]); 
im = im/max(im(:));  
im=im(:);
N1 = A(mat.w1,im,mat.b1); 
N2 = A(mat.w2,N1,mat.b2); 
D = A(mat.w3,N2,mat.b3);  

[v ,i ] =max(D); 

 t = tags(i); 
  
endfunction
