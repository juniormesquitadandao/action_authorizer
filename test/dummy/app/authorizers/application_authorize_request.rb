class ApplicationAuthorizeRequest
  include AuthorizeRequest

  # Specify how to identify the User by request.
  # def self.user_by_ request
  #   request.env["warden"].user
  # end
end
