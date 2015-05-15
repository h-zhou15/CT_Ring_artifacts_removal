% clear
% close all
load('f_1.mat');
para.T_min =0.000; % lower threshold of ring artifacts
para.T_max =0.04; % higher threshold of ring artifacts
para.M_rad = 80 ; % empirical filter width
ring_center.x0 =222; % x coordinate of ring artifact center.
ring_center.y0 = 256;% y coordinate of ring artifact center.
[ f_corr ,delta_f] = ring_artifact_removal( f_1,para,ring_center );

figure,%Line profile
plot(f_1(end/2,:),'go')
hold on
plot(f_corr(end/2,:),'r*')
title('Line profile')
hold off

figure,
a = subplot(1,2,1);
imshow(f_1,[min(f_1(:)) max(f_1(:))]);
title(a,'Original dark-field image');
axis off

b = subplot(1,2,2);
imshow(f_corr,[min(f_1(:)) max(f_1(:))]);
title(b,'Image with ring artifact removal');
axis off