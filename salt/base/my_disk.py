def list():
  cmd = 'dh -h'
  ret = __salt__['cmd.run'](cmd)
  return ret
