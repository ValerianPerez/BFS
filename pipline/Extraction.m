function Extracted_img=Extraction(Original_img)
            if (Original_img == 0)
                error('Error Image.\nThe Original image must contains something');
            end
            img = rgb2gray(Original_img);

            g_img = im2bw(img,0.4);
            %'ForegroundPolarity','dark','Sensitivity','adaptive'
            g_img = ~g_img;
            
            g_img = imopen(g_img,strel('disk',10,0));
            
            allCardsMask = imfill(g_img, 'holes');
            % Extract only the 3 largest blobs
            allCardsMask = bwareafilt(allCardsMask, 3);
            
            [labeledImage, nb_obj] = bwlabel(allCardsMask);
            
            Extracted_img = cell(nb_obj,1);
            Nb_cards_finds = nb_obj
            
            %Create Bounding box
            for i = 1:nb_obj
                cardMask = ismember(labeledImage, i);
                st(i) = regionprops(cardMask, 'Area','BoundingBox');
                Extracted_img{i} = img(st(i).BoundingBox(2):st(i).BoundingBox(2)+st(i).BoundingBox(4)-1,st(i).BoundingBox(1):st(i).BoundingBox(1)+st(i).BoundingBox(3)-1);
            end
        end