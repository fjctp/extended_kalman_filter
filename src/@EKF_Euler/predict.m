function predict(obj, u)
% predict states and covariance matrix using model

F = eye(3,3);

x = F * obj.x + dcm_b2e(obj.x)*obj.dt*u;
P = F * obj.P * F' + obj.Q;

obj.x = x;
obj.P = P;

end