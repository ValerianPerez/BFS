pkg load image; 
file = 'c2.jpg'; 
cd = imread(file); 
gcd = togray(cd); 
figure();
imshow(gcd);
bcd = tobinary(gcd); 
figure(); 
imshow(bcd); 
figure(); 
ecd = edges(bcd); 

