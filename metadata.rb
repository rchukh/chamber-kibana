name             'chamber-kibana'
maintainer       'Roman Chukh'
maintainer_email 'roman.chukh@gmail.com'
license          'Apache 2.0'
description      'Set of recipes for installing Kibana 4'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.1'

supports 'centos'
supports 'debian'
supports 'ubuntu'

recipe "chamber-kibana::default", <<-EOH
Installs Kibana 4 (with or without dependencies).
See attributes for attribute-control of installed dependencies.
EOH
recipe "chamber-kibana::dependencies", <<-EOH
Installs Kibana 4 dependencies (without Kibana 4 itself).
See attributes for attribute-control of installed dependencies.
EOH

# Dependencies
depends 'chef-sugar', '~> 2.4'
depends 'line', '~> 0.5'
depends 'ark', '~> 0.9'
depends 'apt', '~> 2.6.0'
depends 'java', '~> 1.29'

# Optional dependencies
# FIX: 'depends' because of https://github.com/acrmp/foodcritic/issues/159
depends 'elasticsearch', '~> 0.3.10'
suggests 'logstash', '~> 0.9.2'
