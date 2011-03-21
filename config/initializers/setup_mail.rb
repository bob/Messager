ActionMailer::Base.smtp_settings = {
   :address => 'smtp.gmail.com', 
   :port => 587,
   :domain => 'VKalion',
   :authentication => :plain,
   :user_name => 'vkalion.mailer@gmail.com', 
   :password => 'vkalion123'
}