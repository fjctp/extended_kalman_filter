% test_dcm_i2b
% 
% runtests('test_dcm_i2b')

%% Test Identity Matrix
euler = deg2rad([0, 0, 0]);
dcm = dcm_i2b(euler);
assert(all(all(dcm == eye(3, 3))));

%% Test x-axis rotation with x-unit vector
euler = deg2rad([30, 0, 0]);
dcm = dcm_i2b(euler);
v = [1 0 0]';
v_expected = [1 0 0]';
assert(all(dcm * v == v_expected));

%% Test x-axis rotation with y-unit vector
euler = deg2rad([30, 0, 0]);
dcm = dcm_i2b(euler);
v = [0 1 0]';
v_expected = [0 cos(euler(1)) -sin(euler(1))]';
assert(all(dcm * v == v_expected));

%% Test x-axis rotation with z-unit vector
euler = deg2rad([30, 0, 0]);
dcm = dcm_i2b(euler);
v = [0 0 1]';
v_expected = [0 sin(euler(1)) cos(euler(1))]';
assert(all(dcm * v == v_expected));

%% Test y-axis rotation with x-unit vector
euler = deg2rad([0, 30, 0]);
dcm = dcm_i2b(euler);
v = [1 0 0]';
v_expected = [cos(euler(2)) 0 sin(euler(2))]';
assert(all(dcm * v == v_expected));

%% Test y-axis rotation with y-unit vector
euler = deg2rad([0, 30, 0]);
dcm = dcm_i2b(euler);
v = [0 1 0]';
v_expected = [0 1 0]';
assert(all(dcm * v == v_expected));

%% Test y-axis rotation with z-unit vector
euler = deg2rad([0, 30, 0]);
dcm = dcm_i2b(euler);
v = [0 0 1]';
v_expected = [-sin(euler(2)), 0 cos(euler(2))]';
assert(all(dcm * v == v_expected));

%% Test z-axis rotation with x-unit vector
euler = deg2rad([0, 0, 30]);
dcm = dcm_i2b(euler);
v = [1 0 0]';
v_expected = [cos(euler(3)) -sin(euler(3)) 0]';
assert(all(dcm * v == v_expected));

%% Test z-axis rotation with y-unit vector
euler = deg2rad([0, 0, 30]);
dcm = dcm_i2b(euler);
v = [0 1 0]';
v_expected = [sin(euler(3)) cos(euler(3)) 0]';
assert(all(dcm * v == v_expected));

%% Test z-axis rotation with z-unit vector
euler = deg2rad([0, 0, 30]);
dcm = dcm_i2b(euler);
v = [0 0 1]';
v_expected = [0 0 1]';
assert(all(dcm * v == v_expected));

%% Test multiple rotations
euler = deg2rad([30, 45, 60]);
dcm = dcm_i2b(euler);
v = [1 2 3]';
dcm1 = dcm_i2b([0, 0, euler(3)]);
dcm2 = dcm_i2b([0, euler(2), 0]);
dcm3 = dcm_i2b([euler(1), 0, 0]);
v_expected = dcm3 * dcm2 * dcm1 * v;
assert(all(dcm * v == v_expected));