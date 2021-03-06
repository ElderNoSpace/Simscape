clf;
close all;

% clear Htg x y z
% 
% % Htg = [0.8516 -0.02448 -0.5236; 0.01773 0.9997 -0.0179; 0.5239 0.005955 0.8518];
% Htg = [0.1453 -0.002522 -0.9894; 0.01349 0.9999 -0.0005673; 0.9893 -0.01327 0.1453];
% Htg = [0.3511 0.02119 0.9361; -0.08693 0.9962 0.01005; -0.9323 -0.0849 0.3516];
% 
% x = [1 0 0] * Htg
% y = [0 1 0] * Htg
% z = [0 0 1] * Htg
% 
% figure(2)
% hold on
%     plot3([0, x(1)], [0, x(2)], [0, x(3)])
%     plot3([0, y(1)], [0, y(2)], [0, y(3)])
%     plot3([0, z(1)], [0, z(2)], [0, z(3)])
%     grid on
%     xlabel('x')
%     ylabel('y')
%     zlabel('z')
%     set(gca, 'DataAspectRatio', [1 1 1]);
% hold off
% 
% clear Rtf 
% 
% return

% H = Htw.data(:,:,end)
% R = Htw.data(1:3, 1:3, end)

% Htw.data(:,:,end)
% return
f = figure();

floor_length = 0.75;
floor_width = 0.75;

ax1 = subplot(2,2,1);
ax2 = subplot(2,2,2);
ax3 = subplot(2,2,3);
ax4 = subplot(2,2,4);

ax = [ax1, ax2, ax3, ax4];

v = [1,0,0;0,1,0;0,0,1;1,1,1];
titles = ["Front", "Left", "Top", "Orthographic"];

% linkprop([ax1,ax2,ax3,ax4],{'xlabel', 'ylabel', 'zlabel', 'grid'}); 
% linkprop([ax1,ax2],{'xlabel'});
% linkprop([ax2,ax3],{'title'});

for ii=1:size(Htw.data, 3)        
    %% Get centre of mass in world space
    H = Htw.data(:,:,ii);

    % Pack the world-space Forward Kinematics homogeneous matrices
    % fk = [R * FK.HtRSp.data(:,:,ii), R * FK.HtLSp.data(:,:,ii), R * FK.HtRSr.data(:,:,ii), R * FK.HtLSr.data(:,:,ii), R * FK.HtRE.data(:,:,ii), R * FK.HtLE.data(:,:,ii), R * FK.HtRHy.data(:,:,ii), R * FK.HtLHy.data(:,:,ii), R * FK.HtRHr.data(:,:,ii), R * FK.HtLHr.data(:,:,ii), R * FK.HtRHp.data(:,:,ii), R * FK.HtLHp.data(:,:,ii), R * FK.HtRK.data(:,:,ii), R * FK.HtLK.data(:,:,ii), R * FK.HtRAp.data(:,:,ii), R * FK.HtLAp.data(:,:,ii), R * FK.HtRAr.data(:,:,ii), R * FK.HtLAr.data(:,:,ii), R * FK.HtHy.data(:,:,ii), R * FK.HtHp.data(:,:,ii)];
    % fk = [FK.HtRSp.data(:,:,ii) , FK.HtLSp.data(:,:,ii), FK.HtRSr.data(:,:,ii), FK.HtLSr.data(:,:,ii), FK.HtRE.data(:,:,ii), FK.HtLE.data(:,:,ii), FK.HtRHy.data(:,:,ii), FK.HtLHy.data(:,:,ii), FK.HtRHr.data(:,:,ii), FK.HtLHr.data(:,:,ii), FK.HtRHp.data(:,:,ii), FK.HtLHp.data(:,:,ii), FK.HtRK.data(:,:,ii), FK.HtLK.data(:,:,ii), FK.HtRAp.data(:,:,ii), FK.HtLAp.data(:,:,ii), FK.HtRAr.data(:,:,ii), FK.HtLAr.data(:,:,ii), FK.HtHy.data(:,:,ii), FK.HtHp.data(:,:,ii)];
    % fk = [FK.HtRSp.data(:,:,ii) * H, FK.HtLSp.data(:,:,ii) * H, FK.HtRSr.data(:,:,ii) * H, FK.HtLSr.data(:,:,ii) * H, FK.HtRE.data(:,:,ii) * H, FK.HtLE.data(:,:,ii) * H, FK.HtRHy.data(:,:,ii) * H, FK.HtLHy.data(:,:,ii) * H, FK.HtRHr.data(:,:,ii) * H, FK.HtLHr.data(:,:,ii) * H, FK.HtRHp.data(:,:,ii) * H, FK.HtLHp.data(:,:,ii) * H, FK.HtRK.data(:,:,ii) * H, FK.HtLK.data(:,:,ii) * H, FK.HtRAp.data(:,:,ii) * H, FK.HtLAp.data(:,:,ii) * H, FK.HtRAr.data(:,:,ii) * H, FK.HtLAr.data(:,:,ii) * H, FK.HtHy.data(:,:,ii) * H, FK.HtHp.data(:,:,ii)];
    fk = [H * FK.HtRSp.data(:,:,ii), H * FK.HtLSp.data(:,:,ii), H * FK.HtRSr.data(:,:,ii), H * FK.HtLSr.data(:,:,ii), H * FK.HtRE.data(:,:,ii), H * FK.HtLE.data(:,:,ii), H * FK.HtRHy.data(:,:,ii), H * FK.HtLHy.data(:,:,ii), H * FK.HtRHr.data(:,:,ii), H * FK.HtLHr.data(:,:,ii), H * FK.HtRHp.data(:,:,ii), H * FK.HtLHp.data(:,:,ii), H * FK.HtRK.data(:,:,ii), H * FK.HtLK.data(:,:,ii), H * FK.HtRAp.data(:,:,ii), H * FK.HtLAp.data(:,:,ii), H * FK.HtRAr.data(:,:,ii), H * FK.HtLAr.data(:,:,ii), H * FK.HtHy.data(:,:,ii), H * FK.HtHp.data(:,:,ii)];
    
    % Create a transform from the centre of mass location in torso space
    Htc = Transform3D().translate(com.data(:,:,ii));
    % Get centre of mass in world space
    Hwc = H * Htc.tf;
    % Calculate world-space centre of mass
    com_ii = Hwc(1:3, 4);
    
    %% Plot
    % Scatter joints
    n = 4:4:4*20;
    r_s = scatter3([H(1,4), fk(1, n)],[H(2,4), fk(2, n)],[H(3,4), fk(3, n)]);
    % Plot links
    hold on
    % Head
    n = 4*19:4:4*20;
    r_hp = plot3([H(1,4), fk(1, n)],[H(2,4), fk(2, n)],[H(3,4), fk(3, n)]);
    % R Arm
    n = 4*2:4*2:4*6;
    r_rap = plot3([H(1,4), fk(1, n)],[H(2,4), fk(2, n)],[H(3,4), fk(3, n)]);
    % L Arm
    n = 4*1:4*2:4*5;
    r_lap = plot3([H(1,4), fk(1, n)],[H(2,4), fk(2, n)],[H(3,4), fk(3, n)]);
    % R Leg
    n = 4*7:4*2:4*17;
    r_rlp = plot3([H(1,4), fk(1, n)],[H(2,4), fk(2, n)],[H(3,4), fk(3, n)]);
    % L Leg
    n = 4*8:4*2:4*18;
    r_llp = plot3([H(1,4), fk(1, n)],[H(2,4), fk(2, n)],[H(3,4), fk(3, n)]);
    
    % Plot ZMP
    zmp_colour = 'red';
    z = [zmp.data(ii,:) 0 1]';
    z_s = scatter3(z(1), z(2), 0, 'MarkerEdgeColor', zmp_colour);
    z_p = plot3(zmp.data(1:ii,1),zmp.data(1:ii,2),zeros(ii,1), 'color', zmp_colour);
    z_t = text(z(1), z(2), 0.01, 'ZMP', 'color', zmp_colour);
    
    % Plot COM and its projection
    com_colour = [0 0.5 0.5];
    com_s = scatter3(com_ii(1), com_ii(2), com_ii(3), 'x', 'MarkerEdgeColor', com_colour);
    comp_s = scatter3(com_ii(1), com_ii(2), 0, 'x', 'MarkerEdgeColor', com_colour);
    com_p = plot3([com_ii(1), com_ii(1)], [com_ii(2), com_ii(2)], [com_ii(3), 0], '--', 'color', com_colour);
    com_t = text(com_ii(1), com_ii(2), com_ii(3), 'CoM', 'color', com_colour);
    
    % Plot projection of capture step position
    cs_colour = 'magenta';
    cs_ii = [capture_step.data(ii,1:3) 1]';
    cs_s = scatter3(cs_ii(1), cs_ii(2), 0, 'MarkerEdgeColor', cs_colour);
    cs_p = plot3(capture_step.data(1:ii,1), capture_step.data(1:ii,2), zeros(ii,1), '--', 'color', cs_colour);
    cs_t = text(cs_ii(1), cs_ii(2), 0.01, 'CP', 'color', cs_colour);
        
    % Plot support polygon
    
%     H * FK.HtRAr.data(:,:,ii), H * FK.HtLAr.data(:,:,ii)
    
    % Plot ground surface
%     Xp = [floor.length/2, floor.length/2, -floor.length/2, -floor.length/2];
%     Yp = [floor.width/2, -floor.width/2, -floor.width/2, floor.width/2];
    Xp = [floor_length/2, floor_length/2, -floor_length/2, -floor_length/2];
    Yp = [floor_width/2, -floor_width/2, -floor_width/2, floor_width/2];
    Zp = [0, 0, 0, 0];
    f_f = fill3(Xp, Yp, Zp, [0.9, 0.9, 0.9]);
    
    % Set plot parameters
    
%     xlim([-0.5 0.5])
%     ylim([-0.5 0.5])
%     zlim([-inf 0.8])
    hold off
    
    cla(ax1)
    cla(ax2)
    cla(ax3)
    
    for jj=1:length(ax)
        view(ax(jj),v(jj,:));
        
        set(ax(jj), 'DataAspectRatio', [1 1 1]);
        
        title(ax(jj), titles(jj));
        xlabel(ax(jj), 'x (m)');
        ylabel(ax(jj), 'y (m)');
        zlabel(ax(jj), 'z (m)');
        grid(ax(jj), 'on');
        
        copyobj([r_s, r_hp, r_rap, r_lap, r_rlp, r_llp, z_s, z_p, z_t, com_s, comp_s, com_p, com_t, cs_s, cs_p, cs_t, f_f], ax(jj));
    end
%     copyobj([r_s, r_hp, r_rap, r_lap, r_rlp, r_llp, z_s, z_p, z_t, com_s, comp_s, com_p, com_t, cs_s, cs_p, cs_t, f_f], ax2);
    
%     hFigIAxes = findobj('Parent', f, 'Type', 'axes');
%     for jj=2:length(hFigIAxes)
%         hAxes = hFigIAxes(jj);
%         view(hAxes, v(jj,:));
%         set(hAxes, 'DataAspectRatio', [1 1 1]);
%         copyobj([r_s, r_hp, r_rap, r_lap, r_rlp, r_llp, z_s, z_p, z_t, com_s, comp_s, com_p, com_t, cs_s, cs_p, cs_t, f_f], hAxes);
%         xlabel(hAxes, 'x (m)');
%         ylabel(hAxes, 'y (m)');
%         zlabel(hAxes, 'z (m)');
%         grid(hAxes);
%     end
    
    % saveas(gcf,sprintf('f%d.png', time))
    pause(0.001)
end