require 'serverspec'
set :backend, :exec

describe 'Kibana' do

  it 'is listening on port 5601' do
    expect(port(5601)).to be_listening
  end

  it 'has a running service of kibana' do
    expect(service('kibana')).to be_running
  end

end
