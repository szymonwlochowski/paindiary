class ApplicationMailer < ActionMailer::Base
  default from: "szymonwlochowski@sendgrid.com"
  layout 'mailer'
end
