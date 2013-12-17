class User < ActiveRecord::Base
  validates :name, :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
  :recoverable, :rememberable, :trackable, :validatable
  acts_as_taggable
  letsrate_rater
  letsrate_rateable    
  has_many :appointments
  has_many :comments, as: :commentable   
  has_many :schedules
  has_many :activities

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

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end 

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end    
  end
  
  def update_with_password(params, *options)
  if encrypted_password.blank?
    update_attributes(params, *options)
  else
    super
  end
end

  # def password_required?
  #   super && provider.blank?
  # end
end
