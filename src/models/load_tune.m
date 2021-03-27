dt = 1/100;
a = dt^2/2;

pqr_dot_covar = [deg2rad(1e0)^2, deg2rad(1e4)^2, deg2rad(1e1)^2];
Q = diag([a*pqr_dot_covar(1)*a /4, a*pqr_dot_covar(2)*a/4, a*pqr_dot_covar(3)*a/4]);
R = diag([0.0155^2, 0.0124^2, 0.0147^2]);

P0 = deg2rad(1)*eye(3,3);
x0 = [0;0;0];
