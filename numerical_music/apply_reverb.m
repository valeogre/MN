function signal = apply_reverb(signal, impulse_response)
  impulse_response = stereo_to_mono(impulse_response);
  % trec impulsul raspuns din stereo in mono
  signal = fftconv(signal, impulse_response);
  % aplic convolutia FFt intre semnal si impuls
  signal = signal / max(abs(signal));
  % normalizez semnalul rezultat
endfunction

