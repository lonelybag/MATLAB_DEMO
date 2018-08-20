function convolution
clc; clear all; close all;
%
N=10000;                                     % sampling numbers
Tau0=1;                                      % define initial Tau
for i=1:100
    Tau=Tau0/i; 
    TimeRange=linspace(-10*Tau,10*Tau,N);        % display time range
    FreqRange=linspace(-200*pi/i,200*pi/i,N);    % display frequency range
    Half_Tau=Tau/2;                              % -0.5 Tao ==> 0.5 Tao
    RECT=1/Tau*double(abs(TimeRange)<Half_Tau);  % one rectangular pulse
    SINC=sinc(FreqRange*Tau*pi);                 % sinc pulse, Xtra
    
    subplot(2,1,1);
    plot(TimeRange,RECT,'LineWidth',1.5); grid on;
    xlim([-1 1]); ylim([-0.5 120]);
    xlabel('Time'); ylabel('Amplitude');
    title('Made by J Pan')
    
    subplot(2,1,2);
    plot(FreqRange,SINC,'LineWidth',1.5); grid on; 
    xlim([-200*pi/i 200*pi/i]);  ylim([-0.5 1.5]); 
    xlabel('Frequency'); ylabel('Amplitude');
    title('Made by J Pan')
    drawnow;   
end