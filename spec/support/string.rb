class String

  def classify
    class_name = self.split('_').map(&:capitalize).join('')
    if self.index '/'
      module_name, class_name = self.split('/')
      class_name = class_name.split('_').map(&:capitalize).join('')
      class_name = [module_name.capitalize, class_name].join('::')
    end
    class_name
  end

  def constantize
    Object.const_get(self)
  end

  def present?
    !self.size.zero?
  end

end