% Create figure from brain for WM paper
clear
close all

concatenate_folder = '/project/3015069.01/derived/BrainSample-2/ses-03/gre_renaud/concatenate_signals/';
parameter_folder = [concatenate_folder 'parameter_maps/noise4/'];

parameter_list = {'FVF', 'gRatio', 'T2Myelin', 'T2IntraExtraAxonal', 'weight', 'xiMyelin'};

mask = single(load_nii_img_only('/project/3015069.01/derived/BrainSample-2/ses-03/gre_renaud/masks/BrainSample-2_ses-03_gre_orientation-4_brain_mask_int_without_external_csf.nii.gz'));

mean_folder = [parameter_folder 'mean/'];
std_folder = [parameter_folder 'std/'];

for k = 1:length(parameter_list)
    parameter = parameter_list{k};
    mean_parameter_map.(parameter) = load_nii_img_only([mean_folder 'BrainSample-2_ses-03_' parameter '_mean_20_directions_polyfit_cartesian_with_theta_mask_noise4.nii.gz']);
    mean_parameter_map.(parameter)(mask==0) = 10000;

    std_parameter_map.(parameter) = load_nii_img_only([std_folder 'BrainSample-2_ses-03_' parameter '_std_20_directions_polyfit_cartesian_with_theta_mask_noise4.nii.gz']);
    std_parameter_map.(parameter)(mask==0) = 10000;
    
    if ((k == 3) || (k == 4))
        mean_parameter_map.(parameter) = mean_parameter_map.(parameter)*1e3;
        std_parameter_map.(parameter) = std_parameter_map.(parameter)*1e3;
    end
    
    mean_parameter_map_permute.(parameter) = permute(mean_parameter_map.(parameter), [2 3 1]);
    mean_parameter_map_permute.(parameter) = mean_parameter_map_permute.(parameter)(end:-1:1, :, :);
    
    std_parameter_map_permute.(parameter) = permute(std_parameter_map.(parameter), [2 3 1]);
    std_parameter_map_permute.(parameter) = std_parameter_map_permute.(parameter)(end:-1:1, :, :);
end

xslice = 65;
yslice = 65;
zslice = 58;

edge_x = 30;
edge_y = 20;
edge_z = 25;


% for k = 1:length(parameter_list) 
%     parameter = parameter_list{k};
% 
%     figure('Name',parameter)
%     imagesc(squeeze(mean_parameter_map_permute.(parameter)(1+edge_x:end-edge_x, yslice, 1+edge_z:end-edge_z)));
% %     imagesc(squeeze(mean_parameter_map_permute.(parameter)(1+edge_x:end-edge_x, 1+edge_y:end-edge_y, zslice)));
% %     imagesc(squeeze(std_parameter_map_permute.(parameter)(1+edge_x:end-edge_x, yslice, 1+edge_z:end-edge_z)));
% 
%     colormap('gray');
%     cb(k) = colorbar('south');
% % %     x1=get(gca,'position');
%     x=get(cb(k),'Position');
%     x(1) = 0.2;
%     x(2) = 0.01;
%     x(3) = 0.6;
%     x(4) = 0.03;
% 
%     set(cb(k),'Position',x)
% %     set(gca,'position',x1)
%     if k == 1
%         caxis([0 0.6])
%     elseif k == 2
%         caxis([0.5 0.85])
%     elseif k == 3
%         caxis([8 24])
%     elseif k == 4
%         caxis([0 100])
%     elseif k == 5
%         caxis([0.5 3])
%     elseif k == 6
%         caxis([-0.2 0.2])
%     end
%     
%     axis off
% %     title(parameter)
%     set(gca, 'FontSize', 20)
% %     return
% 
% end

t1 = load_nii_img_only([concatenate_folder 'BrainSample-2_ses-03_mp2rage_orientation-4_t1_brain_2_BrainSample-2_ses-03_gre_orientation-4_fa-20_magn_echo-1_brain_without_external_csf.nii.gz']);
t1(mask==0) = 10000;

t1_permute = permute(t1, [2 3 1]);
t1_permute = t1_permute(end:-1:1, :, :);

% magn_TE1 = load_nii_img_only([concatenate_folder 'BrainSample-2_ses-03_gre_orientation-4_fa-20_magn_echo-1_without_external_csf.nii.gz']);
% magn_TE1(mask==0) = 10000;
% 
% magn_TE1_permute = permute(magn_TE1, [2 3 1]);
% magn_TE1_permute = magn_TE1_permute(end:-1:1, :, :);
%     
% figure('Name','magn TE1')
% imagesc(squeeze(magn_TE1_permute(1+edge_x:end-edge_x, yslice, 1+edge_z:end-edge_z)));
% % imagesc(squeeze(magn_TE1_permute(1+edge_x:end-edge_x, 1+edge_y:end-edge_y, zslice)));
% 
% title('mGRE TE1')
% colormap('gray');
% % % cb = colorbar;
% % x1=get(gca,'position');
% % x=get(cb,'Position');
% % x(2) = 0.2;
% % x(4) = 0.6;
% % x(3) = 0.03;
% % set(cb,'Position',x)
% % set(gca,'position',x1)
% 
% caxis([600 1800])
% 
% axis off
% set(gca, 'FontSize', 20)
% 
% 
figure('Name', 't1')
% imagesc(squeeze(t1_permute(1+edge_x:end-edge_x, yslice, 1+edge_z:end-edge_z)));
% imagesc(squeeze(t1_permute(1+edge_x:end-edge_x, 1+edge_y:end-edge_y, zslice)));
% 
% title('t1')
% colormap('gray');
% cb = colorbar;
% x1=get(gca,'position');
% x=get(cb,'Position');
% x(2) = 0.2;
% x(4) = 0.6;
% x(3) = 0.03;
% set(cb,'Position',x)
% set(gca,'position',x1)

caxis([0.2 0.7])

axis off
set(gca, 'FontSize', 20)


    colormap('gray');
    cb(k) = colorbar('south');
% %     x1=get(gca,'position');
    x=get(cb(k),'Position');
    x(1) = 0.2;
    x(2) = 0.01;
    x(3) = 0.6;
    x(4) = 0.03;
    set(cb,'Position',x)

% 









