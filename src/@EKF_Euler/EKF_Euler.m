classdef EKF_Euler < matlab.System
    % EKF_Euler
    %
    % This implements an extended kalman filter to estimate Euler angles
    % using augular rates, body acceleration, and magnetometer.
    %

    % Public, tunable properties
    properties
        Q  (3,3) double {mustBeFinite} = diag([1 1 1])
        R  (3,3) double {mustBeFinite} = diag([1 1 1])
        P0 (3,3) double {mustBeFinite} = diag([1 1 1])
        x0 (3,1) double {mustBeFinite} = zeros(3, 1)
        gyroBias   (3,1) double {mustBeFinite} = zeros(3, 1)
        accelBias  (3,1) double {mustBeFinite} = zeros(3, 1)
        dt = 1/100;
    end
    
    properties(Constant)
        g = 9.81;
    end
    
    properties(DiscreteState)
        P
        x
    end

    properties(Dependent)
        nx
        nz
    end
    
    methods
        function obj = EKF_Euler(varargin)
            setProperties(obj,nargin,varargin{:});
        end
        
        function val = get.nx(obj)
            val = size(obj.Q, 1);
        end
        
        function val = get.nz(obj)
            val = size(obj.R, 1);
        end

    end
    
    
    methods(Access = protected)
        %% Basic functions
        resetImpl(obj);
        setupImpl(obj);
        [x, P] = stepImpl(obj, u, z);
        
        %% Check properties
        function validatePropertiesImpl(obj)
            % Validate related or interdependent property values
            
            if size(obj.Q, 1) ~= size(obj.Q, 2)
                error('Q should be a square matrix');
            end
            
            if size(obj.R, 1) ~= size(obj.R, 2)
                error('R should be a square matrix');
            end
            
            if size(obj.P, 1) ~= size(obj.P, 2)
                error('P should be a square matrix');
            end
            
            if size(obj.x0, 2) ~= 1
                error('x0 should be a n by 1 vector');
            end
        end
        
        function [size,dataType,complexity] = getDiscreteStateSpecificationImpl(~,propertyName)
            if strcmp(propertyName, 'P')
                size = [3, 3];
                dataType = "double";
                complexity = false;
            elseif strcmp(propertyName, 'x')
                size = [3, 1];
                dataType = "double";
                complexity = false;
            end
        end
        
        function [f1, f2] = isOutputFixedSizeImpl(~)
            f1 = true;
            f2 = true;
        end
        
        function [s1, s2] = getOutputSizeImpl(obj)
            s1 = [obj.nx, 1];
            s2 = [obj.nx, obj.nx];
        end
        
        function [dt_1, dt_2] = getOutputDataTypeImpl(~)
            dt_1 = "double";
            dt_2 = "double";
        end
        
        function [c1, c2] = isOutputComplexImpl(~)
            c1 = false;
            c2 = false;
        end
    end
    
    methods(Access = private)
        %% EKF function
        predict(obj, u);
        correct(obj, z);
    end
end
