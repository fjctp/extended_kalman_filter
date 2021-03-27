classdef EKF_Euler < matlab.System
    % EKF_Euler
    %
    % This implements an extended kalman filter to estimate Euler angles
    % using augular rates, body acceleration, and magnetometer.
    %
    % Usage:
    %   obj = EKF_Euler(Q, R)
    %   obj = EKF_Euler(Q, R, P0, [], x0, [])
    %

    % Public, tunable properties
    properties
        Q
        R
        P0
        x0
    end

    properties(DiscreteState)
        P
        x
    end

    % Pre-computed constants
    properties(Access = private)
        nx
        ny
    end
    
    methods(Access = public)
        function obj = EKF_Euler(varargin)            
            p = inputParser;
            addRequired(p, 'Q', @(x) size(x, 1) == size(x, 2));
            addRequired(p, 'R', @(x) size(x, 1) == size(x, 2))
            addParameter(p, 'P0', []);
            addParameter(p, 'x0', []);
            parse(p, varargin{:});
            
            Q = p.Results.Q;
            R = p.Results.R;
            
            nx = size(Q, 1);
            ny = size(R, 1);
            
            P0 = p.Results.P0;
            x0 = p.Results.x0;
            
            if isempty(P0)
                P0 = zeros(nx, nx);
            end
            
            if isempty(x0)
                x0 = zeros(nx, 1);
            end
            
            if size(P0, 1) ~= size(P0, 2)
                error('P0 should be a square matrix\n');
            end
            
            if size(P0, 1) ~= nx
                error('P0 should be a %d by %d matrix\n', nx, nx);
            end
            
            if length(x0) ~= nx
                error('x0 should be a vecto with %d elemts\n', nx);
            end
            
            obj.Q = Q;
            obj.R = R;
            obj.P0 = P0;
            obj.x0 = x0;
            obj.nx = nx;
            obj.ny = ny;
        end
    end
    
    % Min set of methods for system object
    methods(Access = protected)
        resetImpl(obj);
        setupImpl(obj);
        [x, P] = stepImpl(obj, u, z);
    end
    
    % EKF function
    methods(Access = private)
        predict(obj, u, dt);
    end
end
