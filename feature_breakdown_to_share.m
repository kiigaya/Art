% Estimating feature breakdown in different ROIs. by Kyo Iigaya
% kiigaya@caltech.edu 
% 

clear all
close all
%%

subj=;
    
subid=['s',num2str(subj, '%02d')];


glmname= ;

base_mask=;

features = ;


base=;%s01


regions={'V1d','V2d','V3d','V3a','V3b','LO1','LO2','hMT'};
n_regions=length(regions);

for s=1:n_regions
     M=spm_vol([base_mask,regions{s},'.nii']);
    
    
    [ROI_dat,XYZ] = spm_read_vols(M,0);
        
    
    ROI_xyz{s} = XYZ(:,find(ROI_dat > 0));

 
end


for f=1:2  %% low and high level features
    if f==1
       threshold= %% p<0.001 for low-level features;
    else 
       threshold = %% p<0.001 for high-level features;
    end



V=spm_vol([base,'spmF_' num2str(f, '%04d'), '.nii']);
 
    for s=1:n_regions
        xyz_tmp = V.mat\[ROI_xyz{s};ones(1,length(ROI_xyz{s}))];
        masked_V=spm_sample_vol(V,xyz_tmp(1,:),xyz_tmp(2,:),xyz_tmp(3,:),0);
        thresholded=(masked_V>threshold);
        number_survives(f,s)=nnz(thresholded);

    end
end
%%







figure;
subplot(2,3,subj)
xlabels = regions(1:n_regions);
xticks=1:n_regions
X=number_survives./sum(number_survives);
X=flip(X);
H=bar(X', 'stacked');
set(gca, 'Xtick', xticks, 'XTicklabel', xlabels,'TickDir','out','Ticklength',[0.02,1],'box','off');xtickangle(45);

title(subj)
ylabel('feature breakdown');
xlabel('regions');

