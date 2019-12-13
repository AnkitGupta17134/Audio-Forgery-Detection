clc
clear all
close all
[x,fs]=audioread('HC6.wav');
[r,fr]=audioread('HC6e.wav');
%% Downsampling
P=1000;
Q=44100;
xds=resample(x,P,Q); % downsampling from 44.1 Hz to 1000 Hz  
xr=resample(r,P,Q);
%% Bandpass filtering
Fs= 1000;                % sampling frequency (Hz)
F_pass1= 49.2;               %First cut-off frequency (Hz)
F_pass2= 50.8;               %Second cut-off frequency (Hz)

N= 1201;                                                   
win= rectwin(N);                                             
b= fir1(N-1,[F_pass1*2/Fs F_pass2*2/Fs],'bandpass',win,'scale'); 
data_filt = filtfilt(b,1,xds);     
data_filtor= filtfilt(b,1,xr);

%% Overlapping Blocks
signal_len=length(xds);
frame_duration= 0.06; %% 3 cycles of 50hz
frame_length = round(frame_duration * Fs); % samples in a frame
n=length(data_filt);
nb_frames = ceil((n - frame_length)/20)+1;                    % 1sec * Fs
temp=0;
for i =1:nb_frames-1
    
   frames(i,:) = data_filt(temp + 1 : temp + frame_length);
   temp = temp + frame_length - 40;
end

n1=length(data_filtor);
nb_frames1 = ceil((n1 - frame_length)/20)+1;                    % 1sec * Fs
temp1=0;

for i =1:nb_frames1-1
    
   frames1(i,:) = data_filtor(temp1 + 1 : temp1 + frame_length);
   temp1 = temp1 + frame_length - 40;
end
%% Plots
figure
hold on
plot(angle(fft2(frames(960,:))),'r');
plot(angle(fft2(frames1(960,:))),'b');
title('Phase graph of edited and original signal');

hold off
angle(fft2(frames(960,:)))==angle(fft2(frames1(960,:)))
