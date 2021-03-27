function [x, P] = stepImpl(obj, u, z)
    % Implement algorithm. Calculate y as a function of input u and
    % discrete states.
    
    predict(obj, u);
    correct(obj, z);
    
    x = obj.x;
    P = obj.P;
end