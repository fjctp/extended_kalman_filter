# kalman_filter
Implement kalman filter to estimate Euler angles using body angular rate and body acceleration measurements

## Overview
Kalman filter includes two steps: prediction and update. Here are the equations.

#### Predict
![predicted state estimate](https://latex.codecogs.com/gif.latex?x'=Fx+Bu)

![predicted estimate covariance](https://latex.codecogs.com/gif.latex?P=FPF^T+Q)

#### Update
![measurement](https://latex.codecogs.com/gif.latex?y=z-Hx')

![innovation covariance](https://latex.codecogs.com/gif.latex?S=HPH^T+R)

![optimal kalman gain](https://latex.codecogs.com/gif.latex?K=PH^TS^{-1})

![updated state estimate](https://latex.codecogs.com/gif.latex?x=x'+Ky)

![updated estimate covariance](https://latex.codecogs.com/gif.latex?P=(I-KH)P)
