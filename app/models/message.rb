class Message < ActiveRecord::Base
  validates_presence_of :subject, :message => "Your subject line..."
  belongs_to :sender,
  :class_name => 'User',
  :primary_key => 'user_id',
  :foreign_key => 'sender_id'
  belongs_to :recipient,
  :class_name => 'User',
  :primary_key => 'user_id',
  :foreign_key => 'recipient_id'

  def transform_date
   d = Date.parse(self.created_at.to_s)
   return "#{Date::MONTHNAMES[d.mon]} #{d.mday}, #{d.year}"
 end
end
