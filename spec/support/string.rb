class String

  def classify
    'WelcomeAuthorizer'
  end

  def constantize
    Object.const_get('WelcomeAuthorizer')
  end

  def present?
    !self.size.zero?
  end

end