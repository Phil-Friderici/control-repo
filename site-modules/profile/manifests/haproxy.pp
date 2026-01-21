# An example profile
class profile::haproxy {

  include ::haproxy

  # Loadbalancer for Puppet Agents on port 8140
  haproxy::listen { 'agent':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'],
    ports            => [8140],
  }
  haproxy::balancermember { 'agent1':
    listening_service => 'puppet00',
    server_names      => 'ec2-108-129-144-12.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.129.144.12',
    ports             => [8140],
    options           => 'check',
  }
  haproxy::balancermember { 'agent2':
    listening_service => 'puppet00',
    server_names      => 'ec2-34-241-7-165.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '34.241.7.165',
    ports             => [8140],
    options           => 'check',
  }
  haproxy::balancermember { 'agent4-latency':
    listening_service => 'puppet00',
    server_names      => 'ec2-3-148-241-213.us-east-2.compute.amazonaws.com',
    ipaddresses       => '3.148.241.213',
    ports             => [8140],
    options           => 'check',
  }

  # Loadbalancer for PXP Agents on port 8142
  haproxy::listen { 'pxp':
    collect_exported => false,
    ipaddress        => $facts['networking']['ip'],
    ports            => [8142],
  }
  haproxy::balancermember { 'pcp1':
    listening_service => 'puppet00',
    server_names      => 'ec2-108-129-144-12.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '108.129.144.12',
    ports             => [8142],
    options           => 'check',
  }
  haproxy::balancermember { 'pxp2':
    listening_service => 'puppet00',
    server_names      => 'ec2-34-241-7-165.eu-west-1.compute.amazonaws.com',
    ipaddresses       => '34.241.7.165',
    ports             => [8142],
    options           => 'check',
  }
  haproxy::balancermember { 'pxp4-latency':
    listening_service => 'puppet00',
    server_names      => 'ec2-3-148-241-213.us-east-2.compute.amazonaws.com',
    ipaddresses       => '3.148.241.213',
    ports             => [8142],
    options           => 'check',
  }
}
