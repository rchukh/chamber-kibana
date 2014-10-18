Rake::TaskManager.record_task_metadata = true
load './.travis.rakefile'

require 'kitchen'

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
  task :vagrant do
    Kitchen.logger = Kitchen.default_file_logger
    Kitchen::Config.new.instances.each do |instance|
      instance.test(:always)
    end
  end
end

desc 'Prepare metadata.json with knife'
task :metadata do
  require 'chef'
  require 'chef/knife'
  require 'chef/knife/cookbook_metadata'
  require 'chef/knife/cookbook_metadata_from_file'

  @knife = Chef::Knife::CookbookMetadataFromFile.new
  @knife.name_args = ['metadata.rb']
  @knife.run
end

# Show all tasks by default
task :default do
  Rake.application.options.show_tasks = :tasks
  Rake.application.options.show_task_pattern = //
  Rake.application.display_tasks_and_comments
end
