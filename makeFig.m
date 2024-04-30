function makeFig(figI)

F1 = figure(figI);
F1.Position = [200 200 700 650];

F1 = figure(figI);
set(gcf,'renderer','painters');
hold on
set(gcf,'color','w')
set(gca,'LineWidth',2,'FontSize',38,'XColor','k','YColor','k','FontName','Arial','FontWeight','bold')

box on

ax = gca;
ax.Position(1) = 0.2;
ax.Position(2) = 0.2;
ax.Position(3) = 0.7611;
ax.Position(4) = 0.75;
end