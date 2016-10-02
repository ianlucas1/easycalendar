# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "soccer_coach@gmail.com", password:"password")#1
User.create(email: "balet_coach@gmail.com", password:"password")#2
User.create(email: "NIKESB_coach@gmail.com", password:"password")#3
User.create(email: "gymnast_coach@gmail.com", password:"password")#4
User.create(email: "ice_queen@gmail.com", password:"password")#5

User.create(email: "soccermom1@gmail.com", password:"password")#6
User.create(email: "soccermom2@gmail.com", password:"password")#7
User.create(email: "dancedad@gmail.com", password:"password")#8
User.create(email: "gymmom@gmail.com", password:"password")#9
User.create(email: "ice_daddy@gmail.com", password:"password")#10


Child.create(first_name: "John",last_name: "Connor", age: 8, client_id: 6)#1
Child.create(first_name: "Randy",last_name: "Connor", age: 8, client_id: 7)#2
Child.create(first_name: "Stella", last_name: "Artois", age: 14, client_id: 8)#3
Child.create(first_name: "Natalie", last_name: "Bhan", age: 17, client_id:9)#4
Child.create(first_name: "Sarah", last_name: "Jennikasinsmanov", age: 17, client_id:9)#4

Location.create(name: "Mira Mesa Rec", address: "1234 Mira Mesa Way");#1
Location.create(name: "Poway Rec", address: "5678 Poway Center Dr")#2
Location.create(name: "Escondido Rec", address: "91011 Poway Center Dr")#2

Activity.create(name: "Soccer")
Activity.create(name: "Balet")
Activity.create(name: "Skateboarding")
Activity.create(name: "Gymnastics")
Activity.create(name: "Figure Skating")

CoachActivity.create(coach_id:1,activity_id:1)
CoachActivity.create(coach_id:2,activity_id:2)
CoachActivity.create(coach_id:3,activity_id:3)
CoachActivity.create(coach_id:4,activity_id:4)
CoachActivity.create(coach_id:5,activity_id:5)

CoachLocation.create(location_id: 1, coach_id:5)
CoachLocation.create(location_id: 2, coach_id:5)
CoachLocation.create(location_id: 3, coach_id:5)
CoachLocation.create(location_id: 1, coach_id:1)
CoachLocation.create(location_id: 2, coach_id:3)
CoachLocation.create(location_id: 3, coach_id:2)
CoachLocation.create(location_id: 3, coach_id:4)

Invite.create(client_id: 6, coach_activity_id:1)
Invite.create(client_id: 7, coach_activity_id:2)
Invite.create(client_id: 8, coach_activity_id:3)
Invite.create(client_id: 9, coach_activity_id:4)
Invite.create(client_id: 10, coach_activity_id:5)

Appointment.create(coach_activity_id:1, child_id:1 , location_id: 1)
Appointment.create(coach_activity_id:2, child_id: 2, location_id: 1)
Appointment.create(coach_activity_id:3, child_id: 3, location_id: 2)
Appointment.create(coach_activity_id:4, child_id: 4, location_id: 3)
Appointment.create(coach_activity_id:5, child_id: 5, location_id: 3)
