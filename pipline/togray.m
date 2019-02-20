function gray = togray(img)

scale =[0.2989; 0.5870; 0.1140]; 
red = img(:,:,1)*scale(1);
blue = img(:,:,2)*scale(2);
green = img(:,:,3)*scale(3); 
gray=round(red+blue+green); 

end