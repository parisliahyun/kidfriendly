class Message < ActiveRecord::Base
  # attr_accessible :subject, :body, :sender_id, :recipient_id, :read_at, :sender_deleted, :recipient_deleted
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

 def mark_message_deleted(id, user_id)
  self.sender_deleted = true if self.sender_id == user_id and self.id=id
  self.recipient_deleted = true if self.recipient_id == user_id and self.id=id
  self.sender_deleted && self.recipient_deleted ? self.destroy : save!
end

def self.readingmessage(id, reader)
  message = find(id, :conditions => ["sender_id = ? OR recipient_id = ?", reader, reader])
  if message.read_at.nil? && (message.recipient.user_id==reader)
    message.read_at = Time.now
    message.save!
  end
  message
end

def read?
  self.read_at.nil? ? false : true
end

end
