require 'chefspec'

# TODO: Add context for skip_start
# TODO: Add context for skip_restart
describe 'chamber-kibana::default' do
  let(:platform) { 'centos' }
  let(:platform_version) { '6.5' }
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(platform: platform, version: platform_version)
    runner.node.set['kibana']['uid'] = 'uid'
    runner.node.set['kibana']['gid'] = 'gid'
    runner.node.set['kibana']['user'] = 'user'
    runner.node.set['kibana']['dir'] = '/tmp/kibana/dir'
    runner.node.set['kibana']['path']['conf'] = '/tmp/kibana/conf'
    runner.node.set['kibana']['path']['logs'] = '/tmp/kibana/logs'
    runner.node.set['kibana']['pid_path'] = '/tmp/kibana/run'
    runner.node.set['kibana']['templates']['kibana_yml'] = '/tmp/kibana.yml.erb'
    runner.node.set['kibana']['version'] = '4.0.0'
    runner.node.set['kibana']['checksum'] = '0010e467d598b67ba442c2edc5c6df196e8734f826044a58e0da3490a1bb587a'
    runner.node.set['kibana']['host'] = 'http://download.elasticsearch.org'
    runner.node.set['kibana']['repository'] = 'kibana/kibana'
    runner.converge(described_recipe)
  end

  it 'includes basic recipes' do
    expect(chef_run).to include_recipe('chamber-kibana::_preconditions')
    expect(chef_run).to include_recipe('chamber-kibana::dependencies')
    expect(chef_run).to include_recipe('ark')
  end

  it 'creates a group with the default action' do
    expect(chef_run).to create_group('kibana group').with(
      group_name: 'user',
      gid: 'gid',
      system: true
    )
  end

  it 'creates a user with the default action' do
    expect(chef_run).to create_user('kibana user').with(
      username: 'user',
      comment: 'Kibana User',
      home: '/tmp/kibana/dir/kibana',
      shell: '/bin/bash',
      uid: 'uid',
      gid: 'user',
      supports: {
        manage_home: false
      },
      system: true
    )
  end

  it 'creates directory for kibana conf' do
    expect(chef_run).to create_directory('/tmp/kibana/conf').with(
      user: 'user',
      group: 'user',
      mode: 00755
    )
  end

  it 'creates directory for kibana logs' do
    expect(chef_run).to create_directory('/tmp/kibana/logs').with(
      user: 'user',
      group: 'user',
      mode: 00755
    )
  end

  it 'creates directory for kibana pid_path' do
    expect(chef_run).to create_directory('/tmp/kibana/run').with(
      mode: 00755
    )
  end

  it 'creates /etc/init.d/kibana file from template ' do
    expect(chef_run).to create_template('/etc/init.d/kibana').with(
      source: 'kibana.init.erb',
      owner: 'root',
      mode: 00755
    )
  end

  it 'enables a kibana service' do
    expect(chef_run).to enable_service('kibana').with(
      supports: {
        status: true, restart: true
      }
    )
  end

  # TODO: Add test for provided filename | download_url
  # TODO: Add test for missing kibana dir ?
  # TODO: Add test for already downloaded file (not_if section)

  it 'downloads kibana' do
    attributes = {
      url: 'http://download.elasticsearch.org/kibana/kibana/kibana-4.0.0.tar.gz',
      owner: 'user',
      group: 'user',
      version: '4.0.0',
      has_binaries: ['bin/kibana'],
      checksum: '0010e467d598b67ba442c2edc5c6df196e8734f826044a58e0da3490a1bb587a',
      prefix_root: '/tmp/kibana/dir',
      prefix_home: '/tmp/kibana/dir'
    }
    expect(chef_run).to install_ark('kibana').with(attributes)
  end

  it 'creates kibana config from template' do
    attributes = {
      path: '/tmp/kibana/conf/kibana.yml',
      source: '/tmp/kibana.yml.erb',
      owner: 'user',
      group: 'user',
      mode: 00755
    }
    expect(chef_run).to create_template('kibana.yml').with(attributes)
  end
end
