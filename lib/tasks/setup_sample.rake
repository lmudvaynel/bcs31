namespace :db do
  desc 'db:drop db:create db:migrate'
  task :setup_sample => :environment do
    ['db:drop', 'db:create', 'db:migrate'].each do |t|
      Rake::Task[t].execute
    end
  end
end
