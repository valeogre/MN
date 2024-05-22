function mono = stereo_to_mono(stereo)
  %mono = stereo;
  [nr_samples, nr_channels] = size(stereo);

  mono = zeros(nr_samples, 1);

  % for i = 1:nr_samples
  %  mono(i) = sum(stereo(i, :)) / nr_channels;
  %endfor

  mono = mean(stereo, 2);

  % Normalize
  mono = mono / max(abs(mono));
endfunction

