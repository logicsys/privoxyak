# frozen_string_literal: true

name             'privoxyak'
maintainer       'Nathan James'
maintainer_email 'nathan.james@yakara.com'
license          'Apache-2.0'
description      'Installs and configures Privoxy'
version          '0.1.0'
chef_version     '>= 17.0'

source_url 'https://github.com/yakara-ltd/privoxyak'
issues_url 'https://github.com/yakara-ltd/privoxyak/issues'

depends 'selinux_policy'
depends 'systemd'
depends 'yum-epel'

supports 'centos'
supports 'debian'
