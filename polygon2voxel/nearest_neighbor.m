clc
close all
clear all
% find nearest neighbor in the voxel dataset

voxel_root = '/home/lorenz/Desktop/Elective_AI_1/project/datasets/sofaVoxel/train';

% load the file wanted as Volume --> 4d array
load('10152.mat')
 
% choose the index of the batch
index = 1;
v1 = squeeze(Volume(index,:,:,:));
% v2 = squeeze(Volume(index+2,:,:,:));


%% find nearest neighbor iterating among the entire dataset


all_files = dir( voxel_root ); % files inside the subfolder
    
file_num = length(all_files)
e_scalar_min = 10^10;

 
    
for i = 1:1:file_num-2
    
    file_name = all_files(i+2).name;
    file_path = [voxel_root,'/',file_name];
 
    load(file_path)  % load the .mat as Volume variable 
    
    e = v1 - Volume;
    e_scalar = 0;
  
    for i = 1:64
        for j = 1:64
            for k = 1:64
                if (e(i,j,k) == 1 || e(i,j,k) == -1)
                    e_scalar = e_scalar + 1;
                end
            end
        end
    end
    if (e_scalar < e_scalar_min)
        e_scalar_min = e_scalar;
        nn = Volume;
    end
end



%% plot

figure
patch(isosurface(v1,0.1), 'Facecolor', [1 0 0], 'Edgecolor', [0.6 0 0], 'AmbientStrength', 1, 'DiffuseStrength', 1, 'SpecularStrength', 0.1);
axis equal;
grid off;
axis off;
set(gcf,'color','white');figure
patch(isosurface(nn,0.1), 'Facecolor', [1 0 0], 'Edgecolor', [0.6 0 0], 'AmbientStrength', 1, 'DiffuseStrength', 1, 'SpecularStrength', 0.1);
axis equal;
grid off;
axis off;
set(gcf,'color','white');

