function nv
  if test -z "$NVIM_LISTEN_ADDRESS"
    nvim $argv
  else
    nvr --remote $argv
  end
end
