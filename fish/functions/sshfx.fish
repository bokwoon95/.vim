function sshfx
  if test (count $argv) -ne 2
    echo "usage format: sshfx username@remoteserver:/remote/directory/ ~/local/directory/"
    echo "              Mounts the /remote/directory/ onto the ~/local/directory/"
    echo "              umount ~/local/directory/ to unmount (that's 'umount', not 'unmount')"
  else
    sshfs -p 22 $argv[1] $argv[2] -oauto_cache,reconnect,defer_permissions,noappledouble,negative_vncache
  end
end
