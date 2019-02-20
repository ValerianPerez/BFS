function c = uniq(cod)
    cod
    cod(cod(:,1:2)<10,:)=[]; 
    cod
    [n,~] =size(cod(cod(:,5)>0)); 
    
    t=1; 
    while (n>0)
      [~,i] = max(cod(:,5));
      a = cod(i,:); 
      cod(i,:)=[];  
      l=0; 
      for i =1:n-1
           b = cod(i,:);
           j = abs(a-b);
           m = max(j(1:4));  
                if(m<50) 
                    l=[l,i] 
                end 
  
      end 
      l=l(2:end); 
      for i =length(l):-1:1
            cod(l(i),:)=[]; 
      end 
    c(t,:)=a; 
    t=t+1; 
    [n,~] =size(cod(cod(:,5)>0)); 
  end 
 
 
 end 
 






