Forem.user_class = "User"
Forem.email_from_address = "szymonwlochowski@paindiary.herokuapp.com"

Forem.per_page = 20

Rails.application.config.to_prepare do

  Forem.layout = "forem"

end
