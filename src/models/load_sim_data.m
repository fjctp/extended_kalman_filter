% load_sim_data

sim_data.x0 = deg2rad([0, 0, 0]);

sim_data.gyro.seed = [23341, 23342, 23343];
% sim_data.gyro.bias = [0, 0, 0];
sim_data.gyro.bias = [-0.098456801, -0.00451882, -0.006186556];
sim_data.gyro.var = [0.002164253, 0.001151233, 0.001192117].^2;

sim_data.accel.seed = [23351, 23352, 23353];
% sim_data.accel.bias = [0, 0, 0];
sim_data.accel.bias = [0.4840029, 0.2758828, -0.039432];
sim_data.accel.var = [0.015071111, 0.014420412, 0.015951925].^2;