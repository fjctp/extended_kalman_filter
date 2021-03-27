%
%
% see example: https://www.mathworks.com/help/control/ref/ss.kalman.html

% define the model
euler = deg2rad([30,0,0]);

A = eye(3,3);
B = dcm_b2e(euler);
C = H_accel(euler);

% select roll and pitch only
A = A(1:2, 1:2);
B = B(1:2, 1:2);
C = C(1:2, 1:2);

% define Q, R
dt = 1/100;
a = dt^2/2;
pqr_dot_covar = [deg2rad(1e4)^2, deg2rad(1e4)^2, deg2rad(1e1)^2];
Q = diag([a*pqr_dot_covar(1)*a /4, a*pqr_dot_covar(2)*a/4, a*pqr_dot_covar(3)*a/4]);
R = diag([0.0155^2, 0.0124^2, 0.0147^2]);

Q = Q(1:2, 1:2);
R = R(1:2, 1:2);
G = eye(2,2);

% compute kalman filter
Ts = dt;
B = [B B]; % u and w. w: addictive process noise
ny = size(C, 1);
nu = size(B, 2);
D = zeros(ny, nu);
sys = ss(A, B, C, D, Ts);
[kalmf, L, P] = kalman(sys,Q,R);

figure; pzmap(kalmf); grid on;
figure; bodemag(kalmf); grid on;
figure; step(kalmf); grid on;

function mat = H_accel(euler)
% Jacobian Matrix: H
%
% z = Hx

phi = euler(1);
theta = euler(2);
psi = euler(3);

g = 9.81;
mat = zeros(3,3);
mat(1,2) = -cos(theta);
mat(2,1) = cos(phi)*cos(theta);
mat(2,2) = -sin(phi)*sin(theta);
mat(3,1) = -sin(phi)*cos(theta);
mat(3,2) = -cos(phi)*sin(theta);
mat = g*mat;
end