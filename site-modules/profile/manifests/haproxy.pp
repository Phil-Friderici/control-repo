# An example profile
class profile::haproxy {

  include ::haproxy

  haproxy::listen { 'puppet-agent':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'], # $facts['ec2_metadata']['public-ipv4'],
    ports            => [8140],
  }
  haproxy::balancermember { 'server00':
    listening_service => 'puppet00',
    server_names      => 'ec2-108-129-144-12.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.129.144.12',
    ports             => [8140],
    options           => 'check',
  }
#  haproxy::balancermember { 'server01':
#    listening_service => 'puppet00',
#    server_names      => 'ec2-34-241-7-165.eu-west-1.compute.amazonaws.com',
#    ipaddresses       => '34.241.7.165',
#    ports             => [8140],
#    options           => 'check',
#  }
#  haproxy::balancermember { 'server02':
#    listening_service => 'puppet00',
#    server_names      => 'ec2-3-148-241-213.us-east-2.compute.amazonaws.com',
#    ipaddresses       => '3.148.241.213',
#    ports             => [8140],
#    options           => 'check',
#  }

  haproxy::balancermember { 'server05':
    listening_service => 'puppet00',
    server_names      => 'ec2-34-245-138-203.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '34.245.138.203',
    ports             => [8140],
    options           => 'check',
  }

  haproxy::listen { 'puppet-pxp':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'], # $facts['ec2_metadata']['public-ipv4'],
    ports            => [8142],
  }
}
