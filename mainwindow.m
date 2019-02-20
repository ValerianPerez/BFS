clear all 
close all
addpath('pipline/');
addpath('pipline/jsonlab-master');
pkg load image
x = 0.02;
y = 0.03125;
h.x = 0.02;
h.y = 0.03125;
h.MainFrm = figure('position',[200,200,800,400]);
h.img =0;
h.t1 =0;
h.t2 =0; 
 h.ImgFrm = axes ( 
    'position', [2*x, 2*y, 20*x, 28*y], 
    'xtick',    [], 
    'ytick',    [],
    'xlim',     [0, 1], 
    'ylim',     [0, 1]);
  h.titleFrm = axes ( 
    'position', [24*x, 26*y, 20*x, 4*y], 
    'xtick',    [], 
    'ytick',    [],
    'xlim',     [0, 1], 
    'ylim',     [0, 1]);
    h.discFrm = axes ( ...
    'position', [24*x, 20*y, 20*x, 4*y], ...
    'xtick',    [], ... 
    'ytick',    [], ...  
    'xlim',     [0, 1], ... 
    'ylim',     [0, 1] );
     
     h.textFrm = axes ( 
    'position', [24*x, 14*y, 20*x, 4*y], 
    'xtick',    [], 
    'ytick',    [],
    'xlim',     [0, 1], 
    'ylim',     [0, 1]);
    
    
    h.ButtonFrm = uicontrol (h.MainFrm, 
    'style',    'pushbutton',  
    'string',   'OPEN IMAGE',
    'units',    'normalized', 
    'position', [24*x, 2*y, 9*x, 3*y],
    'callback', { @previewImage, h.ImgFrm});
  
    
     h.ButtonFrm = uicontrol (h.MainFrm, 
    'style',    'pushbutton',  
    'string',   'Process',
    'units',    'normalized', 
    'position', [38*x, 2*y, 9*x, 3*y],
    'callback', { @pipeline });

 set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor")); 

guidata(gcf, h);
  
