function [regions, characteristics] = extremalRegion(image, display_debug)

%% Begin
%%close all;

if(nargin == 1)
    display_debug = false;
end

if(size(image, 3)>1)
    image = rgb2gray(image);
end
bnw = im2bw(image);
bnw=[0, bnw(1,:), 0;
    bnw(:,1), bnw, bnw(:,end);
    0, bnw(end,:), 0];
gradientChannel = zeros(size(image,1), size(image,2));


gradientChannel = ~(im2bw(image));

if(display_debug)
    figure('name', 'GradientChannel');
    imshow(gradientChannel);
end



etiquettes2 = bwlabel(gradientChannel, 8);

if(display_debug)
  %  figure('name', 'Extremal regions');
  %  imagesc(etiquettes2); axis image;
end

%% Separation des zones extremale

nbLabel = max(max(etiquettes2));

regions = {nbLabel};
indice = 1;

[height, width] = size(etiquettes2);

if(display_debug)
    rmdir("./debug");
    mkdir("./debug");
end

textend = 0;


for i=1:nbLabel
    currentRegion = zeros(height, width);
    currentRegion(etiquettes2==i) = 1;
    
    [row, col] = find(currentRegion);
    upperline = min(row);
    lowerline = max(row);
    if(upperline < (height/2) && lowerline > (height/2))
        % Les caracteristiques sont stockees comme suit :
        % Aire
        % Ratio hauteur/largeur (de la Bounding box)
        % Perimetre
        % Nombre d'Euler
        props = regionprops(currentRegion, 'Area','BoundingBox', 'Perimeter', 'EulerNumber');
        ratio = abs(lowerline -upperline) / (max(col) - min(col));
        distanceWtext = abs(min(col) - textend) / width;
        
        if(distanceWtext > 0.15)
            break;
        end
        
        textend = min(col);
        
        if(props.EulerNumber > (-3) && ratio > 0.5)
            characteristics{indice} = [props.Area,  
                                       ratio,
                                       props.Perimeter,
                                       props.EulerNumber];
            % Decoupage selon la bounding box
            x = floor(props.BoundingBox(2))+1;
            a=floor(props.BoundingBox(4))-1;
            y=floor(props.BoundingBox(1))+1;
            b=floor(props.BoundingBox(3))-1;
            regions{indice} = currentRegion(x:x+a,y:y+b);
            
            
            if(display_debug)
                %figure; imagesc(currentRegion(x:x+a,y:y+b)); axis image;
                file = ['./debug/',num2str(indice),'.png']; 
                imwrite(currentRegion(x:x+a,y:y+b),file); 
            end
            indice = indice + 1;
        end
    end
end



