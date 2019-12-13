clear;
clc;

%% Input Signal
[r,fr] = audioread('HC6.wav');    %% clean speech
[x,fs] = audioread('HC6e.wav');  %% raw signals

%% Downsampling
P=1000;
Q=44100;
xds=resample(x,P,Q); % downsampling from 44.1 KHz to 1000 Hz
yds=resample(r,P,Q); % downsampling from 44.1 KHz to 1000 Hz

%% Filtering using Band Pass 
Fs = 1000;                % sampling frequency (Hz)
F_pass1 = 49.2;               %First cut-off frequency (Hz)
F_pass2 = 50.8;               %Second cut-off frequency (Hz)                                         %Normalized frequency
N = 1201;                                                   %Filter order (must be odd number)
win = hamming(N);                                             %Window function
b = fir1(N-1,[F_pass1*2/Fs, F_pass2*2/Fs],'bandpass',win,'scale'); %Filter coefficients (impulse response)
data_filt = filtfilt(b,1,xds);                                     %Apply filtering
data_filt2 = filtfilt(b,1,yds);                                     %Apply filtering
figure(3);subplot(3,1,1);plot(xds);subplot(3,1,2);plot(data_filt(:,1));subplot(3,1,3);plot(data_filt2(:,1));