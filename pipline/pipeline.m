function pipeline(hObject, eventdata)
h = guidata(hObject);
 h.discFrm = axes ( ...
    'position', [24*h.x, 20*h.y, 20*h.x, 4*h.y], ...
    'color',    [0.9, 0.95, 1], ...
    'xtick',    [], ... 
    'ytick',    [], ...  
    'xlim',     [0, 1], ... 
    'ylim',     [0, 1] );
im = h.img; 
cdl = Extraction(im);

cd = cdl{1};
%figure()
%imshow(cd);
[t1 t2] = detect(cd);
%imwrite(t1,'./debug/title.png'); 
%imwrite(t2,'./debug/discr.png'); 
[r,c] = extremalRegion(t1,false);
t =recongize(r{1}); 
for i=2:length(r)
t = [t,recongize(r{i})];   
end 

t

setimage(h.titleFrm,t1); 
setimage(h.ImgFrm,cd); 
axes(h.discFrm); 
text(0.05,0.5,t,'fontsize',20); 
axis image off; 
guidata(hObject,h);
endfunction
