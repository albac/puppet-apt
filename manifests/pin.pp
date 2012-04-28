# pin.pp
# pin a release in apt, useful for unstable repositories

define apt::pin(
  $packages = '*',
  $priority = 0,
  $release = "${name}"
) {

  include apt::params

  file { "${name}.pref":
    ensure  => file,
    path    => "${apt::params::root}/preferences.d/${name}",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "# ${name}\nPackage: ${packages}\nPin: release a=${release}\nPin-Priority: ${priority}",
  }
}
