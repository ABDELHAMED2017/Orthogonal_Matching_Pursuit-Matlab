clc;
clear all;
data = importdata('winequality-red.csv',';',1);     data = data.data;
[m,n] = size(data);
training = int16(0.7*m);    testing = m - training;

%% take data for training and predict top k variables in xout
y = data(1:training,n);     A = data(1:training,1:n-1); k=3;
xout = OMP(y,A,k);

%% take data for testing and predict y using them and store as y_pred
y = data(training+1:m,n);	A = data(training+1:m,1:n-1);
y_pred = A*xout;

%% calculate RMSE
RMSE = sqrt(mean((y-y_pred).^2));   disp(RMSE);