function bcd = tobinary(cd,f)
  if(f==2)
  nsc = tonegative(cd);
  nsc(nsc<120)=0;
  bcd =nsc;
 else 
  nsc = tonegative(cd);
  bcd = edge(nsc,'canny');
 end  
end
