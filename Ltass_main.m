clear;
clc;

%% Input Signal
[r,fr] = audioread('HC6.wav');    %% clean speech
[x,fs] = audioread('HC6e.wav');  %% raw signals

%% Ltass calculation
[ spect, frqs ] = LTASS(r,4096,fr);
[ spect2, frqs2 ] = LTASS(x,4096,fs);

subp = abs(spect-spect2);
figure(1),plot(frqs,subp);title('Difference b/w spectrums');

diff = 0; % Audio diffrence calculate
for i=1:size(spect(:,1))
    diff=diff+abs(spect(i,1)-spect2(i,1));
end

if diff==0
   disp('Signal is original');
else
    disp('Signal is Forged');
end