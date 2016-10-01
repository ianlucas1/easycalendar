class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  has_many :children, foreign_key: 'parent_id'
  has_many :appointments, through: :children
  has_many :coach_activities, foreign_key: :coach_id
  has_many :activities, through: :coach_activities
  has_many :client_locations, foreign_key: :client_id
  has_many :coach_locations, foreign_key: :coach_id
  has_many :coaches, through: :appointments
  has_many :clients, through: :appointments
  has_many :clients_children, through: :clients, source: :children
  has_many :notification_receivers, foreign_key: 'receiver_id'
  has_many :notifications_received, through: :notification_receivers, source: :notification
  has_many :notifications_sent, through: :appointments, source: :notifications
  has_many :messages_received, class_name: "Message", foreign_key: :receiver_id
  has_many :messages_sent, class_name: "Message", foreign_key: :sender_id

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
