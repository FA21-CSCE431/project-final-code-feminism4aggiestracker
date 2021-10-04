class JoinsController < ApplicationController
  def create
    @meeting = Meeting.find(params[:id])
    @join = @meeting.joins.create(params[:join])
    redirect_to meeting_path(@meeting)
  end
end
