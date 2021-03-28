% dt = 1/100;
% a = dt^2/2;
% pqr_dot_covar = [deg2rad(1e0)^2, deg2rad(1e4)^2, deg2rad(1e1)^2];
% Q2 = diag([a*pqr_dot_covar(1)*a /4, a*pqr_dot_covar(2)*a/4, a*pqr_dot_covar(3)*a/4]);

pqr_var = [0.002164253, 0.001151233, 0.001192117].^2;
Q = diag(pqr_var); 

accel_var = [0.015071111, 0.014420412, 0.015951925].^2;
R = diag(accel_var);

P0 = deg2rad(1)*eye(3,3);
x0 = [0;0;0];
