function [ spect, frqs ] = LTASS( speech_folder_OR_vec, nfft, fs )
% Computes the Long-Term Average Speech Spectrum.

speech = speech_folder_OR_vec;


%%
win_=rectwin(nfft);
ovlap = 0;

[spect,frqs]=pwelch(speech,win_,ovlap,nfft,fs,'power'); % Power spectrum
spect = sqrt(spect); % Magnitude spectrum

end

% Adult Audiologic Rehabilitation by Joseph J. Monatano, EdD and Jaclyn B
% Spitzer


% An Automatic Digital Audio
% Authentication/Forensics System
% ZULFIQAR ALI1
% , MUHAMMAD IMRAN2
% , AND MANSOUR ALSULAIMAN1
% 1Digital Speech Processing Group, Department of Computer Engineering, College of Computer and Information Sciences,
% King Saud University, Riyadh 12372, Saudi Arabia
% 2College of Computer and Information Sciences, King Saud University, Riyadh 12372, Saudi Arabia