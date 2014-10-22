require 'chefspec'

describe 'chamber-kibana::dependencies' do
  let(:platform) { 'centos' }
  let(:platform_version) { '6.5' }
  let(:chef_run) do
    ChefSpec::SoloRunner.new(platform: platform, version: platform_version).converge(described_recipe)
  end

  it 'should include the chef-sugar recipe' do
    expect(chef_run).to include_recipe('chef-sugar::default')
  end

  %w(java elasticsearch).each do |dependency|
    context "when #{dependency} installation is enabled" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: platform, version: platform_version) do |node|
          node.set['kibana']['dependency']["install_#{dependency}"] = true
        end.converge(described_recipe)
      end

      it "includes the `#{dependency}::default` recipe" do
        expect(chef_run).to include_recipe("#{dependency}::default")
      end
    end

    context "when #{dependency} installation is disabled" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: platform, version: platform_version) do |node|
          node.set['kibana']['dependency']["install_#{dependency}"] = false
        end.converge(described_recipe)
      end

      it "does not include the `#{dependency}::default` recipe" do
        expect(chef_run).to_not include_recipe("#{dependency}::default")
      end

      if dependency == 'java'
        it 'raises an error if java is not presented on the system' do
          allow_any_instance_of(Chef::Recipe).to receive(:installed?).and_return(false)
          expect { chef_run.converge }.to raise_error
        end
        it 'does not raise an error if java is presented on the system' do
          allow_any_instance_of(Chef::Recipe).to receive(:installed?).and_return(true)
          expect { chef_run.converge }.to_not raise_error
        end
      end
    end
  end

end
