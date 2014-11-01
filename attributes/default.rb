# === VERSION AND LOCATION
#
default['kibana']['version']       = '4.0.0-BETA1.1'
# sha256 ( shasum -a 256 FILENAME )
default['kibana']['checksum']      = '0010e467d598b67ba442c2edc5c6df196e8734f826044a58e0da3490a1bb587a'
default['kibana']['host']          = 'http://download.elasticsearch.org'
default['kibana']['repository']    = 'kibana/kibana'
default['kibana']['filename']      = nil
default['kibana']['download_url']  = nil

# === DEPENDENCIES
#
default['kibana']['dependency']['install_java']          = true
default['kibana']['dependency']['install_elasticsearch'] = true

# === NAMING
#
default['kibana']['node']['name']    = node.name

# === USER & PATHS
#
default['kibana']['dir']       = '/usr/local'
default['kibana']['bindir']    = '/usr/local/bin'
default['kibana']['user']      = 'kibana'
default['kibana']['uid']       = nil
default['kibana']['gid']       = nil

default['kibana']['path']['conf'] = '/usr/local/etc/kibana'
default['kibana']['path']['logs'] = '/usr/local/var/log/kibana'

default['kibana']['pid_path']  = '/usr/local/var/run'
default['kibana']['pid_file']  = "#{node['kibana']['pid_path']}/kibana-#{node['kibana']['node']['name'].to_s.gsub(/\W/, '_')}.pid"

default['kibana']['templates']['kibana_yml'] = 'kibana.yml.erb'

# === Service
#
default['kibana']['skip_start']   = false
default['kibana']['skip_restart'] = false

# === Kibana instance configurations
#
default['kibana']['java_opts'] = '-Xms128m -Xmx128m $JAVA_OPTS'
# Kibana Port
default['kibana']['http']['port'] = 5601
# The Elasticsearch instance to use
default['kibana']['elasticsearch']['server'] = 'http://127.0.0.1:9200'
# Kibana uses an index in Elasticsearch to store saved searches, visualizations
# and dashboards. It will create an new index if it doesn't already exist.
default['kibana']['elasticsearch']['index'] = 'kibana-int'

# TODO: Add loaded and default applications support
