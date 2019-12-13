# Audio-Forgery-Detection

In the 20th century, a technological revolution started a new way of communication
which is audio recordings, etc. But audio corruption and tampering the audio file
exposing our reliability on them. Tampering includes watermarking the copyrights in
visual data, in audio, its a repetition of phrases or initial credits, before the main content.
Suppressing the frequency component of credits will make it indistinguishable towards
the human sensation. We will be using an MP3 dataset of 128 kpbs bitrate.

Proposed methodology
1. An audio dataset with original audio and corresponding tampered audio.
2. Initial Frequency domain analysis. Correlation.
3. Feature extraction with Matching and Audio Segmentation.
4. Correlating and Similarities.


Steps to run files for forgery detection.

1) For LTASS method you have to run Ltass_main.m file.
2) For ENF method there are two methods.
2a. ENF plot results in two plots of signal. One is forged other one is Original. Editing is visible in plot.
2b. ENF phase results in phase correlation of two signals resulting an integer.
