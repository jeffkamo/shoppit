# For example, for Gmail...

ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'anatidaus',
  :password             => '3Sports!',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}
