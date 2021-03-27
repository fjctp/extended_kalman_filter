function plot_noise(logsout)

gyroNoiseWithBias = logsout.get('gyroNoiseWithBias').Values;
accelNoise = logsout.get('accelNoise').Values;

figure;
subplot(2, 1, 1);
plot(gyroNoiseWithBias*rad2deg(1));
subplot(2, 1, 1);
plot(accelNoiseWithBias);

end