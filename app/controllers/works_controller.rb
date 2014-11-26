class WorksController < ApplicationController

  def index
    @works = Work.all.group_by do |work|
      day = Date.strptime(work.checkin.strftime('%Y-%m-%d'), '%Y-%m-%d')
      (day - day.wday).strftime('%Y-%m-%d')
    end
  end

end
