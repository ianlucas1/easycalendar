require "open-uri"
require 'httparty'
require 'json'

class User  < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2, :google]
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


  has_many :contacts
  has_many :events

  def self.find_for_google_oauth2(oauth, signed_in_resource=nil)
    credentials = oauth.credentials
    data = oauth.info
    puts "=======data=========="
    puts data
    puts "=======credentials=========="
    puts credentials
    # puts credentials[:token]
    # self.token = credentials[:token]
    user = User.where(email: data["email"]).first

    unless user
     user = User.create(
        first_name: data["first_name"],
        last_name: data["first_name"],
        picture: data["image"],
        email: data["email"],
        password: Devise.friendly_token[0,20],
        token: credentials[:token],
        refresh_token: credentials.refresh_token
     )
    end
    user.get_google_contacts   # Wait for next section
    user.get_google_calendars  # Wait for next section
    user
  end

  def get_google_contacts
  url = "https://www.google.com/m8/feeds/contacts/default/full?access_token=#{token}&alt=json&max-results=100"
  response = open(url)
  json = JSON.parse(response.read)
  my_contacts = json['feed']['entry']

  my_contacts.each do |contact|
    name = contact['title']['$t'] || nil
    email = contact['gd$email'] ? contact['gd$email'][0]['address'] : nil
    tel = contact['gd$phoneNumber'] ? contact["gd$phoneNumber"][0]["$t"] : nil
    if contact['link'][1]['type'] == "image/*"
      picture = "#{contact['link'][1]['href']}?access_token=#{token}"
    else
      picture = nil
    end
    contacts.create(name: name, email: email, tel: tel, picture: picture)
  end
end

  # def get_google_contacts
  #   # response = HTTParty.get('https://www.google.com/m8/feeds/contacts/default/full?max-results=50000')
  #   # puts "=======body=========="
  #   # puts response.body
  #   # puts "=======code=========="
  #   # puts response.code
  #   # puts "=======messag=========="
  #   # puts response.message
  #   # puts "=======headers=========="
  #   # puts response.headers.inspect

  #   uri = URI.parse("https://www.google.com/m8/feeds/contacts/default/full?max-results=50000")

  #   http = Net::HTTP.new(uri.host, uri.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  #   request = Net::HTTP::Get.new(uri.request_uri)
  #   # request['Authorization'] = env[GOOGLE_CLIENT_SECRET]
  #   # "Token token=#{self.token}"

  #   response = http.request(request)
  #   # stuff = open(response)
  #   puts "=======uri-body=========="
  #   puts response.body
  #   puts "=======code=========="
  #   puts response.code
  #   puts "=======messag=========="
  #   puts response.message
  #   puts "=======headers=========="
  #   puts response.inspect
  #   json = JSON.parse(response.body)
  #   my_contacts = json['feed']['entry']

  #   # my_contacts.each do |contact|
  #   #   name = contact['title']['$t'] || nil
  #   #   email = contact['gd$email'] ? contact['gd$email'][0]['address']  : nil
  #   #   tel = contact['gd$phoneNumber'] ? contact["gd$phoneNumber"][0][ "$t"] : nil
  #   #   if contact['link'][1]['type'] == "image/*"
  #   #     picture = "#{contact['link'][1]['href']}?access_token=#{token }"
  #   #   else
  #   #     picture = nil
  #   #   end
  #   #   contacts.create(name: name, email: email, tel: tel, picture:  picture)
  #   # end
  # end

  # def auth_client

  # end

  def get_google_calendars
  url = "https://www.googleapis.com/calendar/v3/users/me/calendarList?access_token=#{token}"
  response = open(url)
  json = JSON.parse(response.read)
  calendars = json["items"]
  calendars.each { |cal| get_events_for_calendar(cal) }
end

  def get_events_for_calendar(cal)

  url = "https://www.googleapis.com/calendar/v3/calendars/#{cal["id"]}/events?access_token=#{token}"
  response = open(url)
  json = JSON.parse(response.read)
  my_events = json["items"]

  my_events.each do |event|
    name = event["summary"] || "no name"
    creator = event["creator"] ? event["creator"]["email"] : nil
    start = event["start"] ? event["start"]["dateTime"] : nil
    status = event["status"] || nil
    link = event["htmlLink"] || nil
    calendar = cal["summary"] || nil

    events.create(name: name,
                  creator: creator,
                  status: status,
                  start: start,
                  link: link,
                  calendar: calendar
                  )
  end

  end

end
