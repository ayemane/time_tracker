class WorksController < ApplicationController

  def index
    @works = Work.all.group_by do |work|
      day = Date.strptime(work.checkin.strftime('%Y-%m-%d'), '%Y-%m-%d')
      (day - day.wday)
    end
  end

  def destroy
    work = Work.find(params[:id])
    id = work.id
    work.destroy
    render json: {status: 200, deleted: id}
  end

end
