function previewImage (hObject, eventdata, ImageFrame)
  h = guidata(hObject);
  [fname, fpath] = uigetfile();
  Img = imread (fullfile(fpath, fname));
  axes(ImageFrame);
  imshow(Img, []);
  axis image off
  h.img=Img;
  guidata(hObject,h);
  
end