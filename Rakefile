require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

require 'rake/testtask'

Rake::TestTask.new('test:features' => 'test:prepare') do |t|
  t.libs << 'test'
  t.pattern = 'test/r**/*_test.rb'
end
