class ReactsAuthorizer < ApplicationAuthorizer
  def react
    true
  end

  def remove_reaction
    reactable_class.exists?(user: current_user, id: params[:reactable_id])
  end

  private

  def reactable_class
    reactable_type = params[:reactable_type]
    reactable_type.constantize
  end
end
