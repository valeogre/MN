function signal = apply_reverb(signal, impulse_response)
  if size(impulse_response, 2) > 1
    impulse_response = stereo_to_mono(impulse_response);
  endif
  signal = fftconv(signal, impulse_response);
  signal = signal / max(abs(signal));
endfunction

