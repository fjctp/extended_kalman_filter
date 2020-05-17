classdef ekf < matlab.System
    % EKF Extended Kalman Filter
    %
    % This implements an extended kalman filter.

    % Public, tunable properties
    properties
        Q
        R
        P0
    end

    properties(DiscreteState)
        P
        x
    end

    % Pre-computed constants
    properties(Access = private)

    end
    
    % Min set of methods for system object
    methods(Access = protected)
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
        end

        function [x, P] = stepImpl(obj,z)
            % Implement algorithm. Calculate y as a function of input u and
            % discrete states.
            x = z;
        end

        function resetImpl(obj)
            % Initialize / reset discrete-state properties
        end
    end
    
    % EKF function
    methods(Access = protected)
        function predict(obj, u, dt)
            R_b2e = [];
            F = [
                eye(3,3), zeros(3,3);
                R_b2e*dt, eye(3,3)];
            B = 0;
            obj.x = F*obj.x + B*u;
        end
        
        function update_gyro(obj, z)
            
        end
        
        function update_accel(obj, z)
            
        end
        
        function mat = F()
            
        end
        
        function mat = H()
            
        end
    end
end
