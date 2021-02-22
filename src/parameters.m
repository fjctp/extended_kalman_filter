dt = 1/100;
a = dt^2/2;

pqr_dot_covar = [deg2rad(5), deg2rad(5), deg2rad(5)];
Q = diag([a*pqr_dot_covar(1)*a, a*pqr_dot_covar(2)*a, a*pqr_dot_covar(3)*a]);
R = diag([0.1, 0.1, 0.1])*9.81;

P0 = [1e-06 0 0;0 1e-06 0;0 0 1e-06];
x0 = [0;0;0];

lpfreqHz = 25;
lpf = tf(1, [1/(lpfreqHz*2*pi), 1]);
lpfDt = c2d(lpf, dt, 'tustin');

[lpfDtNum, lpfDtDen] = tfdata(lpfDt);
