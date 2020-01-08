clear all
clc
close all

root = '/home/lorenz/Desktop/Elective_AI_1/project/datasets/ModelNet10/table';
voxel_root = '/home/lorenz/Desktop/Elective_AI_1/project/datasets/tableVoxel';

category_file_struct = dir(root); % returns the elements of the folder (dataset category)
category_num = length(category_file_struct);% number of elements inside the folder

category_num=2; %train and test sets
for i_category = 1:1:category_num
    category_file_name = category_file_struct(i_category+2).name; % the first 2 are points, name of subfolder (ex bathtub)
    category_file_path = [root, '/', category_file_name];
    voxel_category_path = [voxel_root,'/',category_file_name]; % subfolder
    
    if ~exist(voxel_category_path) 
        mkdir(voxel_category_path)
    end
    
    all_files = dir( category_file_path ); % files inside the subfolder
    
    file_num = length(all_files)
    
    for i = 1:1:file_num-2
        file_name = all_files(i+2).name;
        file_path = [category_file_path,'/',file_name];
        voxel_mat_path = [voxel_category_path,'/',file_name];
        
        % if file is a .off
        if (file_name(end-2:end) == 'off')
            FV = load_off(file_path);
            % ADJUSTMENT REQUIRED FOR AN EXTRA POINT inside load_off for
            % this dataset (modelnet)
        elseif (file_name(end-2:end) == 'mat') % need TO ADAPT to dataset
            load(file_path)
        end
        
        % name of vertices may not be FV
        % FV : A struct containing FV.faces with a facelist Nx3 and FV.vertices
        %        with a Nx3 vertice list
        Volume=polygon2voxel(FV,[64 64 64],'auto'); % discretize the mesh and return it in voxel space
        save([voxel_mat_path(1:end-3), 'mat'], 'Volume');
    end
    
end

% root = '/home/lorenz/Desktop/Elective_AI_1/project/datasets/ModelNet10/monitor';
% voxel_root = '/home/lorenz/Desktop/Elective_AI_1/project/datasets/monitorVoxel';
% visualize(root, voxel_root, 'monitor_0266','/train/')
