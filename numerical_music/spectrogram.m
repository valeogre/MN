function [S, f, t] = spectrogram(signal, fs, window_size)
    % Length of the signal
    N = length(signal);
    
    % Number of windows
    num_windows = floor(N / window_size);
    
    % Initialize the spectrogram matrix
    S = zeros(window_size / 2, num_windows);
    
    % Hann window function
    hann_window = hanning(window_size);
    
    % Loop through each window
    for k = 1:num_windows
        % Start and end indices for the window
        start_idx = (k-1) * window_size + 1;
        end_idx = start_idx + window_size - 1;
        
        % Get the current window
        current_window = signal(start_idx:end_idx);
        
        % Apply the Hann window
        current_window = current_window .* hann_window;
        
        % Compute the FFT with resolution twice the size of the window
        fft_result = fft(current_window, 2 * window_size);
        
        % Discard the conjugate part and take only the first half
        fft_result = fft_result(1:window_size / 2);
        
        % Store the result in the spectrogram matrix
        S(:, k) = abs(fft_result);
    end
    
    % Compute the frequency vector
    % f = (0:(window_size / 2 - 1)) * (fs / window_size);
    
    % Compute the time vector
    % t = (0:(num_windows - 1)) * (window_size / fs);
end
