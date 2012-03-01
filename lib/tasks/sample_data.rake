namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Sem",
      :email => "sem@gmail.com",
      :password => "foobar",
      :password_confirmation => "foobar")
    #admin.toggle!(:admin)
    
    99.times do |n|
      #name  = Faker::Name.name
      #email = "example-#{n+1}@railstutorial.org"
      begin name = Faker::Internet.user_name end while name.length < 6
      email = "#{name}@gmail.com"
      password  = "password"
      
      begin 
        User.create!(:name => name,
          :email => email,
          :password => password,
          :password_confirmation => password)
      rescue
        
      end
    end
    
    User.all.each do |user|
      rand(3).times do
        user.posts.create!(:content => Faker::Lorem.sentence(5))
      end
    end
  end
end