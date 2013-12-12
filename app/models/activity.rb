class Activity < ActiveRecord::Base
  belongs_to :requester,
    :class_name => 'User',
    :primary_key => 'user_id',
    :foreign_key => 'vendor_id'
  belongs_to :vendor,
    :class_name => 'User',
    :primary_key => 'user_id',
    :foreign_key => 'vendor_id'   

  letsrate_rateable    
  has_many :comments, as: :commentable

  def transform_date
    d = Date.parse(self.date.to_s)
    return "#{Date::MONTHNAMES[d.mon]} #{d.mday}, #{d.year}"
  end

  def date
    self.scheduled_at
  end
  
  def self.all_by_date
    all_by_date = {}
    all_activities = Activity.order("scheduled_at")
    all_activities.each do |e|
      date_string = e.date.to_s
      all_by_date[date_string] = [] if all_by_date[date_string].nil?
      all_by_date[e.date.to_s] << e
    end  
      all_by_date
  end
end