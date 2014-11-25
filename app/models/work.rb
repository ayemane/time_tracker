# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  checkin    :datetime
#  checkout   :datetime
#  job        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Work < ActiveRecord::Base

  scope :open, -> {where('checkout is ?', nil)}

  def self.checkin!
    work = Work.new(checkin: DateTime.now)
    work.save
    work
  end

  def checkout!
    self.checkout = DateTime.now
    save
  end

  def hours
    ci = Time.parse checkin.to_s
    co = Time.parse (checkout || DateTime.now).to_s
    (co - ci)/3600
  end
end
