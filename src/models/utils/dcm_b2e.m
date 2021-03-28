function dcm = dcm_b2e(euler)
% dcm = dcm_b2e(euler)
%
% create a DCM to rotate a vector to body frame from Euler frame
% see http://www.chrobotics.com/library/understanding-euler-angles

phi = euler(1);
theta = euler(2);

dcm = [
    1 sin(phi)*tan(theta) cos(phi)*tan(theta);
    0 cos(phi) -sin(phi);
    0 sin(phi)*sec(theta) cos(phi)*sec(theta)];

end

