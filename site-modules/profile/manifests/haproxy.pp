# An example profile
class profile::haproxy {

  include ::haproxy

  haproxy::listen { 'puppet-agent':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'], # $facts['ec2_metadata']['public-ipv4']
    ports            => [8140],
  }
  haproxy::balancermember { 'compiler1':
    listening_service => 'puppet-agent',
    server_names      => 'ec2-108-129-199-101.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.129.199.101',
    ports             => [8140],
    options           => 'check',
  }
  haproxy::balancermember { 'compiler2-legacy':
    listening_service => 'puppet-agent',
    server_names      => 'ec2-3-253-89-81.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '3.253.89.81',
    ports             => [8140],
    options           => 'check',
  }
  haproxy::balancermember { 'compiler3-latency':
    listening_service => 'puppet-agent',
    server_names      => 'ec2-18-191-40-220.us-east-2.compute.amazonaws.com',
    ipaddresses       => '18.191.40.220',
    ports             => [8140],
    options           => 'check',
  }

  haproxy::listen { 'puppet-pxp':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'], # $facts['ec2_metadata']['public-ipv4']
    ports            => [8142],
  }
  haproxy::balancermember { 'compiler1':
    listening_service => 'puppet-pxp',
    server_names      => 'ec2-108-129-199-101.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.129.199.101',
    ports             => [8142],
    options           => 'check',
  }
  haproxy::balancermember { 'compiler2-legacy':
    listening_service => 'puppet-pxp',
    server_names      => 'ec2-3-253-89-81.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '3.253.89.81',
    ports             => [8142],
    options           => 'check',
  }
  haproxy::balancermember { 'compiler3-latency':
    listening_service => 'puppet-pxp',
    server_names      => 'ec2-18-191-40-220.us-east-2.compute.amazonaws.com',
    ipaddresses       => '18.191.40.220',
    ports             => [8142],
    options           => 'check',
  }
}
