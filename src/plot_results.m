function plot_results(logsout)

truth = logsout.get('truth').Values;
eulerEst = logsout.get('eulerEst').Values;
absDiff = logsout.get('absDiff').Values;


labels = ["roll","pitch","yaw"];
figure;
for ii = 1:3
    subplot(4, 1, ii);
    hold on
    plot(truth.euler.Time, rad2deg(truth.euler.Data(:,ii)));
    plot(eulerEst.Time, rad2deg(eulerEst.Data(:,ii)));
    grid on;
    ylabel(labels(ii));
    legend('Truth', 'Est');
end

subplot(4, 1, 4);
hold on
plot(absDiff*rad2deg(1));
grid on;
ylabel('|Error (deg)|');
legend('roll', 'pitch', 'yaw');

end