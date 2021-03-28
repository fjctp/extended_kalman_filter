function dcm = dcm_i2b(euler)
% dcm = dcm_i2b(euler)
%
% create a DCM to rotate a vector to body frame from inertia frame
% see http://www.chrobotics.com/library/understanding-euler-angles

phi = euler(1);
theta = euler(2);
psi = euler(3);

dcm = [
    cos(theta) * cos(psi), cos(theta) * sin(psi), -sin(theta);
    -cos(phi) * sin(psi) + sin(phi) * sin(theta) * cos(psi), cos(phi) * cos(psi) + sin(phi) * sin(theta) * sin(psi), sin(phi) * cos(theta);
    sin(phi) * sin(psi) + cos(phi) * sin(theta) * cos(psi), -sin(phi) * cos(psi) + cos(phi) * sin(theta) * sin(psi), cos(phi) * cos(theta)
];

end

