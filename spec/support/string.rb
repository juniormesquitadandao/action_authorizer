class String

  def classify
    self.split('_').map(&:capitalize).join('')
  end

  def constantize
    Object.const_get(self)
  end

  def present?
    !self.size.zero?
  end

end