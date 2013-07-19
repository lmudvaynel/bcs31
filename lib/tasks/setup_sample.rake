namespace :db do
  desc 'db:drop db:create db:migrate db:sample'
  task :setup_sample => :environment do
    ['db:drop', 'db:create', 'db:migrate', 'db:sample'].each do |t|
      Rake::Task[t].execute
    end
  end
end
