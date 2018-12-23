class ObservationsController < ApplicationController
  before_action :set_thought
  def create
    observation = @thought.comments.create( comment: params[:comment], user: current_user )
    observation.save
    redirect_to thought_path(@thought.id)
  end

  private

    def set_thought
      @thought = Thought.find(params[:thougth_id])
    end
end
