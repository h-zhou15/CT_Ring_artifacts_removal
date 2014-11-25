clear
close all
load('f_0.mat');
para.T_min =0; % lower threshold of ring artifacts
para.T_max =0.8; % higher threshold of ring artifacts
para.M_rad = 40 ; % empirical filter width
ring_center.x0 =275; % x coordinate of ring artifact center.
ring_center.y0 = 303;% y coordinate of ring artifact center.
[ f_corr ,delta_f] = ring_artifact_removal( f_0,para,ring_center );

figure,%Line profile
plot(f_0(end/2,:),'go')
hold on
plot(f_corr(end/2,:),'r*')
title('Line profile')
hold off

figure,
a = subplot(1,2,1);
imshow(f_0);
title(a,'Original dark-field image');
axis off

b = subplot(1,2,2);
imshow(f_corr);
title(b,'Image with ring artifact removal');
axis off