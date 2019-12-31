function plotAtoms(pos)

clf reset
hold on

R = 0.3;
[Xv,Yv,Zv] = sphere(25);
Xv = Xv * R;
Yv = Yv * R;
Zv = Zv * R;

cBall = zeros(1, size(pos,1));

for t1=1:size(pos,1) 
    cBall(t1)=surf(Xv + pos(t1,1),Yv + pos(t1,2),Zv + pos(t1,3));
    set(cBall(t1),'facecolor','k','edgecolor','none','facelighting','gouraud' );
    
    for t2=(t1+1):size(pos,1)
        rad=sqrt(sum((pos(t1,:)-pos(t2,:)).^2));
        if rad > 0.85 && rad < 1.15
            line([pos(t1,1) pos(t2,1)],[pos(t1,2) pos(t2,2)], [pos(t1,3) pos(t2,3)],'Color',[0,0.8,0.1],'LineWidth',4);
        elseif rad < 0.05
            error('Overlapping Atoms');
        end
    end      
end

axis equal
camlight right
set(gca, 'CameraPosition', [100,200,300]);
hold off

end