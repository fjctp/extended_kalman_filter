function plot_results(logsout)

truth = logsout.get(5).Values;
eulerEst = logsout.get('eulerEst').Values;


labels = ["roll","pitch","yaw"];
figure;
for ii = 1:3
    subplot(3, 1, ii);
    hold on
    plot(truth.euler.Time, rad2deg(truth.euler.Data(:,ii)));
    plot(eulerEst.Time, rad2deg(eulerEst.Data(:,ii)));
    grid on;
    ylabel(labels(ii));
    legend('Truth', 'Est');
end

end