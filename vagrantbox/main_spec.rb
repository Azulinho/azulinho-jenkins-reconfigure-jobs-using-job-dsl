require_relative 'spec_helper'

jobs_list = [
  'DSL_BUILD-job1',
  'DSL_BUILD-job2',
  'DSL_DEPLOY-job1',
  'DSL_DEPLOY-job2',
  'DSL_DEPLOY-job3',
  'seed'
]


describe command('sudo java -jar /opt/jenkins/jenkins-cli.jar -s http://127.0.0.1:8080/ list-jobs') do
  jobs_list.each do |job|
    its(:stdout) { should include job }
  end
end

