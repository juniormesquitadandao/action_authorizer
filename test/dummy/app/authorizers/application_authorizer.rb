class ApplicationAuthorizer < ActionAuthorizer::Base
  def authenticated
    request.env['warden'].user
  end
end