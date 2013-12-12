class User < ActiveRecord::Base
  validates :name, :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  letsrate_rater
  letsrate_rateable       

  has_many :received_activities,
  :class_name => 'Activity',
  :primary_key => 'user_id',
  :foreign_key => 'vendor_id'       

  has_many :received_messages,
  :class_name => 'Message',
  :primary_key => 'user_id',
  :foreign_key => 'recipient_id',
  :order => "messages.created_at DESC",
  :conditions => ["messages.recipient_deleted = ?", false]

  def unread_messages?
    unread_message_count > 0 ? true : false
  end

  def unread_message_count
    eval 'messages.count(:conditions => ["recipient_id = ? AND read_at IS NULL", self.user_id])'
  end       
end
