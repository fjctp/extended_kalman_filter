function predict(obj, u, dt)
    R_b2e = [];
    F = [
        eye(3,3), zeros(3,3);
        R_b2e*dt, eye(3,3)];
    B = 0;
    obj.x = F*obj.x + B*u;
end