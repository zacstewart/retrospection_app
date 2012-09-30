desc 'Deploy Safely to Heroku'
task :deploy do
  app = 'retrospection'
  sh 'git push origin master'
  sh 'git push heroku master'
  sh "heroku pgbackups:capture --expire --app #{app}"
  sh "heroku run bundle exec rake db:migrate --app #{app}"
  sh "heroku restart --app #{app}"
  sh "curl http://#{app}.herokuapp.com > /dev/null 2> /dev/null"
end
