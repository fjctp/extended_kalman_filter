function correct(obj, z)
% update states and covariance matrix using measurement

dcm = dcm_i2b(obj.x);
z_est = dcm * [0, 0, obj.g]';
y = z - z_est;

H = Hj(obj.x);

S = H * obj.P * H' + obj.R;
K = obj.P*H'*inv(S);

x = obj.x + K*y;
nr = size(K,1);
nc = size(H,1);
I = eye(nr,nc);
P = (I-K*H)*obj.P;

obj.x = x;
obj.P = P;
end

function mat = Hj(x)
% Jacobian Matrix: H
%
% z = Hx

phi = x(1);
theta = x(2);
psi = x(3);

g = 9.81;
mat = zeros(3,3);
mat(1,2) = -cos(theta);
mat(2,1) = cos(phi)*cos(theta);
mat(2,2) = -sin(phi)*sin(theta);
mat(3,1) = -sin(phi)*cos(theta);
mat(3,2) = -cos(phi)*sin(theta);
mat = g*mat;
end
