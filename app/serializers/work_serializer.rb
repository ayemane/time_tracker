class WorkSerializer < ActiveModel::Serializer
  include ApplicationHelper
  attributes :id, :checkin, :checkout, :hours, :job

  def checkin
    format_time object.checkin
  end

  def checkout
    format_time object.checkout
  end

  def hours
    format_hours object.hours
  end
end
