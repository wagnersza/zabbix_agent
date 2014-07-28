# == Class: zabbix_agent
#
# Full description of class zabbix_agent here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { zabbix_agent:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class zabbix_agent (

  $package_version = 'latest',

  ##### Conf paramiters

  ### Option: PidFile
  # Name of PID file.
  #
  # Mandatory: no
  # Default:
  # PidFile=/tmp/zabbix_agentd.pid
  $pidfile = '',

  ### Option: LogFile
  # Name of log file.
  # If not set, syslog is used.
  #
  # Mandatory: no
  # Default:
  # LogFile=
  $logfile = '',

  ### Option: LogFileSize
  # Maximum size of log file in MB.
  # 0 - disable automatic log rotation.
  #
  # Mandatory: no
  # Range: 0-1024
  # Default:
  # LogFileSize=1
  $logfilesize = '',

  ### Option: DebugLevel
  # Specifies debug level
  # 0 - no debug
  # 1 - critical information
  # 2 - error information
  # 3 - warnings
  # 4 - for debugging (produces lots of information)
  #
  # Mandatory: no
  # Range: 0-4
  # Default:
  # DebugLevel=3
  $debuglevel = '',

  ### Option: SourceIP
  # Source IP address for outgoing connections.
  #
  # Mandatory: no
  # Default:
  # SourceIP=
  $sourceip = '',

  ### Option: EnableRemoteCommands
  # Whether remote commands from Zabbix server are allowed.
  # 0 - not allowed
  # 1 - allowed
  #
  # Mandatory: no
  # Default:
  # EnableRemoteCommands=0
  $enableremotecommands = '',

  ### Option: LogRemoteCommands
  # Enable logging of executed shell commands as warnings.
  # 0 - disabled
  # 1 - enabled
  #
  # Mandatory: no
  # Default:
  # LogRemoteCommands=0
  $logremotecommands = '',

  ##### Passive checks related

  ### Option: Server
  # List of comma delimited IP addresses (or hostnames) of Zabbix servers.
  # No spaces allowed. First entry is used for receiving list of and sending active checks.
  # If IPv6 support is enabled then '127.0.0.1', '::127.0.0.1', '::ffff:127.0.0.1' are treated equally.
  #
  # Mandatory: yes
  # Default:
  # Server=
  $server = '',

  ### Option: ServerActive
  # List of comma delimited IP:port (or hostname:port) pairs of Zabbix servers for active checks.
  # No spaces allowed.
  # If port is not specified, default port is used.
  # IPv6 addresses must be enclosed in square brackets if port for that host is specified.
  # If port is not specified, square brackets for IPv6 addresses are optional.
  # If this parameter is not specified, active checks are disabled.
  # Mandatory: no
  # Default:
  # ServerActive=
  $serveractive = '',

  ### Option: Hostname
  # Unique, case sensitive hostname.
  # Required for active checks and must match hostname as configured on the server.
  # Value is acquired from HostnameItem if undefined.
  #
  # Mandatory: no
  # Default:
  # Hostname=
  $hostname = '',

  ### Option: HostnameItem
  # Item used for generating Hostname if it is undefined.
  # Ignored if Hostname is defined.
  #
  # Mandatory: no
  # Default:
  # HostnameItem=system.hostname
  $hostnameitem = '',

  ### Option: ListenPort
  # Agent will listen on this port for connections from the server.
  #
  # Mandatory: no
  # Range: 1024-32767
  # Default:
  # ListenPort=10050
  $listenport = '',

  ### Option: ListenIP
  # List of comma delimited IP addresses that the agent should listen on.
  #
  # Mandatory: no
  # Default:
  # ListenIP=0.0.0.0
  $listenip = '',

  ### Option: DisablePassive
  # Disable passive checks. The agent will not listen on any TCP port.
  # Only active checks will be processed.
  # 0 - do not disable
  # 1 - disable
  #
  # Mandatory: no
  # Default:
  # DisablePassive=0
  $disablepassive = '',

  ##### Active checks related

  ### Option: DisableActive
  # Disable active checks. The agent will work in passive mode listening for server.
  #
  # Mandatory: no
  # Default:
  # DisableActive=0
  $disableactive = '',

  ### Option: ServerPort
  # Server port for retrieving list of and sending active checks.
  #
  # Mandatory: no
  # Default:
  # ServerPort=10051
  $serverport = '',

  ### Option: RefreshActiveChecks
  # How often list of active checks is refreshed, in seconds.
  #
  # Mandatory: no
  # Range: 60-3600
  # Default:
  # RefreshActiveChecks=120
  $refreshactivechecks = '',

  ### Option: BufferSend
  # Do not keep data longer than N seconds in buffer.
  #
  # Mandatory: no
  # Range: 1-3600
  # Default:
  # BufferSend=5
  $buffersend = '',

  ### Option: BufferSize
  # Maximum number of values in a memory buffer. The agent will send
  # all collected data to Zabbix Server or Proxy if the buffer is full.
  #
  # Mandatory: no
  # Range: 2-65535
  # Default:
  # BufferSize=100
  $buffersize = '',

  ### Option: MaxLinesPerSecond
  # Maximum number of new lines the agent will send per second to Zabbix Server
  # or Proxy processing 'log' and 'logrt' active checks.
  # The provided value will be overridden by the parameter 'maxlines',
  # provided in 'log' or 'logrt' item keys.
  #
  # Mandatory: no
  # Range: 1-1000
  # Default:
  # MaxLinesPerSecond=100
  $maxlinespersecond = '',

  ### Option: AllowRoot
  # Allow the agent to run as 'root'. If disabled and the agent is started by 'root', the agent
  #       will try to switch to user 'zabbix' instead. Has no effect if started under a regular user.
  # 0 - do not allow
  # 1 - allow
  #
  # Mandatory: no
  # Default:
  # AllowRoot=0
  $allowroot = '',

  ############ ADVANCED PARAMETERS #################

  ### Option: Alias
  # Sets an alias for parameter. It can be useful to substitute long and complex parameter name with a smaller and simpler one.
  #
  # Mandatory: no
  # Range:
  # Default:
  # Alias=
  $alias_ = '',

  ### Option: StartAgents
  # Number of pre-forked instances of zabbix_agentd that process passive checks.
  #
  # Mandatory: no
  # Range: 1-100
  # Default:
  # StartAgents=3
  $startagents = '',

  ### Option: Timeout
  # Spend no more than Timeout seconds on processing
  #
  # Mandatory: no
  # Range: 1-30
  # Default:
  # Timeout=3
  $timeout = '',

  ### Option: Include
  # You may include individual files or all files in a directory in the configuration file.
  #
  # Mandatory: no
  # Default:
  # Include=
  # Include=/etc/zabbix/zabbix_agentd.userparams.conf
  # Include=/etc/zabbix/zabbix_agentd/
  $include = '',

  ####### USER-DEFINED MONITORED PARAMETERS #######

  ### Option: UnsafeUserParameters
  # Allow all characters to be passed in arguments to user-defined parameters.
  # 0 - do not allow
  # 1 - allow
  #
  # Mandatory: no
  # Range: 0-1
  # Default:
  # UnsafeUserParameters=0
  $unsafeuserparameters = '',

  ### Option: UserParameter
  # User-defined parameter to monitor. There can be several user-defined parameters.
  # Format: UserParameter=<key>,<shell command>
  # Note that shell command must not return empty string or EOL only.
  # See 'zabbix_agentd' directory for examples.
  #
  # Mandatory: no
  # Default:
  # UserParameter=
  $userparameter = '',

  ### Option: HostMetadataItem
  # Optional parameter that defines a Zabbix agent item used for getting host metadata.
  # This option is only used when HostMetadata is not defined.
  # Supports UserParameters and aliases. Supports system.run[] regardless of EnableRemoteCommands value.
  # Host metadata is used only at host auto-registration process (active agent).
  # During an auto-registration request an agent will log a warning message if
  # the value returned by the specified item is over the limit of 255 characters.
  # The value returned by the item must be a UTF-8 string otherwise it will be ignored.
  # This option is supported in version 2.2.0 and higher.
  #
  # Mandatory: no
  # Default:
  # HostMetadataItem=
  $hostmetadataitem = '',

) {

  package { 'zabbix-agent':
    ensure => $package_version,
  }

  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => present,
    content => template('zabbix_agent/zabbix_agentd.conf.erb'),
    mode    => '0644',
    owner   => root,
    group   => root,
  }

  service { 'zabbix-agent':
    ensure     => running,
    enable     => true,
    subscribe  => File['/etc/zabbix/zabbix_agentd.conf'],
    require    => [ File['/etc/zabbix/zabbix_agentd.conf'], Package['zabbix-agent'] ]
  }

}
