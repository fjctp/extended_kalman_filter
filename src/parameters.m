dt = 1/100;
a = dt^2/2;

pqr_dot_covar = [deg2rad(1), deg2rad(1), deg2rad(1)];
Q = diag([a*pqr_dot_covar(1)*a, a*pqr_dot_covar(2)*a, a*pqr_dot_covar(3)*a]);
R = diag([0.1, 0.1, 0.1])*9.81;

mdlName = 'kalman_filter';
hws = get_param(mdlName, 'modelworkspace');
hws.assignin('dt', dt);
hws.assignin('Q', Q);
hws.assignin('R', R);