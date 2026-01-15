# An example profile
class profile::haproxy {

  include ::haproxy
  haproxy::listen { 'puppet00':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'],
    ports            => [8140],
  }
  haproxy::balancermember { 'server00':
    listening_service => 'puppet00',
    server_names      => 'ec2-34-242-127-136.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '34.242.127.136',
    ports             => [8140],
    options           => 'check',
  }
  haproxy::balancermember { 'server01':
    listening_service => 'puppet00',
    server_names      => 'ec2-34-253-54-87.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '34.253.54.87',
    ports             => [8140],
    options           => 'check',
  }
}
