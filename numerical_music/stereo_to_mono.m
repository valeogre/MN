function mono = stereo_to_mono(stereo)
  
  [nr_samples, nr_channels] = size(stereo);
  % deterin numarul de sample-uri si de canale ale semnalului
  mono = zeros(nr_samples, 1);

  for i = 1:nr_samples
    mono(i) = sum(stereo(i, :)) / nr_channels;
  endfor
  % parcurg sample-urile si determin media pe  canale pentru a forma semnalul mono

  mono = mono / max(abs(mono));
  % Normalizez
endfunction

