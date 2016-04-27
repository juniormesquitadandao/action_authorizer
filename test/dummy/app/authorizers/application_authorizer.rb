class ApplicationAuthorizer < ActionAuthorizer::Base

  def index
    # true
  end

  protected

  def authenticated
    request.env['warden'].user
  end

end