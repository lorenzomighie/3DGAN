function [countvert, countfaces] = visualize(root, voxel_root, filename, category)

    meshpath = [root, category, filename, '.off']
    voxelpath = [voxel_root, category, filename, '.mat'];
    FV = load_off(meshpath);
    figure
    c = zeros(length(FV.vertices),1);
    trisurf(FV.faces, FV.vertices(2:end,1), FV.vertices(2:end,2), FV.vertices(2:end,3), 'Facecolor','red');
    %trisurf(FV.faces, FV.vertices(:,1), FV.vertices(:,2), FV.vertices(:,3),'Facecolor','red');
    axis equal;
    grid off;
    axis off;
    set(gcf,'color','white');
    load(voxelpath); % will assign the wanted Volume variable
    figure
    patch(isosurface(Volume,0.1), 'Facecolor', [1 0 0], 'Edgecolor', [0.6 0 0], 'AmbientStrength', 1, 'DiffuseStrength', 1, 'SpecularStrength', 0.1);
    axis equal;
    grid off;
    axis off;
    set(gcf,'color','white');

    none = 0;
    
    countvert = FV.vertices(1:end,:);
    countfaces = FV.faces;
    
    % patch(isosurface(squeeze(Volume(1,:,:,:)),0), 'Facecolor', [0 1 0]);
end
