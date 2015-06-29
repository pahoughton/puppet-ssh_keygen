# Define: ssh_keygen
# Parameters:
# $home
#
define ssh_keygen($home=undef) {

  Exec { path => '/bin:/usr/bin' }

  if $home == undef {
    $home_real = "/home/${name}"
  } else {
    $home_real = $home
  }

  exec { "ssh_keygen-${name}":
    command => shellquote('ssh-keygen',
                          '-f',
                          "${ssh_key_fn}",
                          '-N',
                          '',
                          '-C',
                          'puppet generated key')
    user    => $ssh_user,
    creates => ["${ssk_key_fn}",
                "${ssh_key_fn}.pub"],
  }

}
