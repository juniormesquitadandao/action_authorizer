module Reactable
  extend ActiveSupport::Concern

  included do
    has_many :reacts, as: :reactable
  end

  def react(reaction, current_user)
    React.create(reactable: self, user: current_user, reaction: reaction)
  end

  def react?(current_user)
    set_react(current_user)
    @react.present? ? @react : false
  end

  def update_react(reaction, current_user)
    set_react(current_user)
    @react.update(reaction: reaction)
  end

  def remove_reaction(current_user)
    set_react(current_user)
    @react.destroy
  end

  private

  def set_react(current_user)
    @react = React.find_by(reactable: self, user: current_user)
  end
end