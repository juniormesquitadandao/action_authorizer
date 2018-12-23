class ReactsController < ApplicationController
  before_action :set_reactable

  def react
    if @reactable.react?(current_user)
      @reactable.update_react(params[:reaction], current_user)
    else
      @reactable.react(params[:reaction], current_user)
    end
  end

  def remove_reaction
    @reactable.remove_reaction(current_user)
  end

  private

    def set_reactable
      reactable_type = params[:reactable_type]
      @reactable = reactable_type.constantize.find(params[:reactable_id])
    end
end