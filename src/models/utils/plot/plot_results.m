function plot_results(logsout)

truth = logsout.get('truth').Values;
truthEuler = logsout.get('truthEuler').Values;
eulerEst = logsout.get('eulerEst').Values;
absDiff = logsout.get('absDiff').Values;


labels = ["roll","pitch","yaw"];
figure;
for ii = 1:3
    if ~exist('ax', 'var')
        ax(1) = subplot(4, 1, ii);
    else
        ax(end+1) = subplot(4, 1, ii);
    end
    hold on
    plot(truthEuler.Time, rad2deg(truthEuler.Data(:,ii)));
    plot(eulerEst.Time, rad2deg(eulerEst.Data(:,ii)));
    grid on;
    ylabel(labels(ii));
    legend('Truth', 'Est');
end

ax(end+1) = subplot(4, 1, 4);
hold on
plot(absDiff*rad2deg(1));
grid on;
ylabel('|Error (deg)|');
legend('roll', 'pitch', 'yaw');

linkaxes(ax, 'x');

dd.diff.x = absDiff.Data(:,1)*rad2deg(1);
dd.diff.y = absDiff.Data(:,2)*rad2deg(1);
dd.diff.z = absDiff.Data(:,3)*rad2deg(1);

dd.mean.x = mean(dd.diff.x);
dd.mean.y = mean(dd.diff.y);
dd.mean.z = mean(dd.diff.z);

dd.std.x = std(dd.diff.x);
dd.std.y = std(dd.diff.y);
dd.std.z = std(dd.diff.z);

t = table(["mean","std"]', [dd.mean.x, dd.std.x]', ...
    [dd.mean.y, dd.std.y]', [dd.mean.z, dd.std.z]', ...
    'VariableNames', {'Stat', 'X', 'Y', 'Z'});
disp(t);

end