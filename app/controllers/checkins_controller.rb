class CheckinsController < ApplicationController
  include ApplicationHelper

  before_action only: :update do
    @work = Work.open.first
  end

  def create
    #render json: Work.checkin!
    work = Work.checkin!
    render partial: 'works/work', locals: {work: work}
  end

  def update
    @work.checkout! if @work
    #render partial: 'works/work', locals: {work: @work}
    #render json: {id: @work.id, checkout: format_time(@work.checkout), checkin: format_time(@work.checkin), hours: format_hours(@work.hours)}
    render json: @work
  end
end
