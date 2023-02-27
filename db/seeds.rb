require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "cleaning db"

Booking.destroy_all
Drone.destroy_all
User.destroy_all

puts "DB cleaned"
DRONE_BRANDS_MODELS = [
  {
    "brand": "DJI",
    "models": [
      "DJI Mavic Mini",
      "DJI Mavic Air 2",
      "DJI Phantom 4 Pro",
      "DJI Inspire 2"
    ]
  },
  {
    "brand": "Parrot",
    "models": [
      "Parrot Bebop 2",
      "Parrot Anafi",
      "Parrot Disco"
    ]
  },
  {
    "brand": "Autel Robotics",
    "models": [
      "Autel Robotics EVO II",
      "Autel Robotics X-Star Premium",
      "Autel Robotics Dragonfish"
    ]
  },
  {
    "brand": "Yuneec",
    "models": [
      "Yuneec Typhoon H",
      "Yuneec Typhoon H Plus",
      "Yuneec Mantis Q"
    ]
  },
  {
    "brand": "Holy Stone",
    "models": [
      "Holy Stone HS720",
      "Holy Stone HS110D",
      "Holy Stone HS100D"
    ]
  },
  {
    "brand": "Hubsan",
    "models": [
      "Hubsan H107D+",
      "Hubsan H502S",
      "Hubsan H501S",
      "Hubsan H109S X4 Pro"
    ]
  },
  {
    "brand": "Ryze Tech",
    "models": [
      "Ryze Tech Tello",
      "Ryze Tech Tello EDU"
    ]
  },
  {
    "brand": "Potensic",
    "models": [
      "Potensic T18",
      "Potensic D58",
      "Potensic T25"
    ]
  },
  {
    "brand": "Snaptain",
    "models": [
      "Snaptain SP500",
      "Snaptain A15H",
      "Snaptain S5C"
    ]
  },
  {
    "brand": "Ruko",
    "models": [
      "Ruko F11",
      "Ruko U11 GPS",
      "Ruko F11 Pro"
    ]
  },
  {
    "brand": "MJX",
    "models": [
      "MJX Bugs 5W",
      "MJX Bugs 2SE",
      "MJX Bugs 3 PRO"
    ]
  },
  {
    "brand": "Contixo",
    "models": [
      "Contixo F22",
      "Contixo F24 Pro",
      "Contixo F18"
    ]
  },
  {
    "brand": "JJRC",
    "models": [
      "JJRC H68",
      "JJRC X11",
      "JJRC X12"
    ]
  },
  {
    "brand": "Eachine",
    "models": [
      "Eachine E58",
      "Eachine E511S",
      "Eachine EX4"
    ]
  },
  {
    "brand": "SG906",
    "models": [
      "SG906 Pro 2",
      "SG906 Pro",
      "SG906"
    ]
  }
]



def new_users
  for i in (0..10)
    user = User.new(
      email: "user_#{i}@mail.com",
      password: "azerty",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
    user.save!
  end
end

def new_drones
  50.times do
    drone = Drone.new(
      brand: DRONE_BRANDS_MODELS.sample[:brand],
      model: DRONE_BRANDS_MODELS.sample[:models].sample,
      user: User.all.sample
    )
    drone.save!
  end
end

def new_bookings
  4.times do
    booking = Booking.new(
      booking_start: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
      booking_end: Faker::Date.between(from: 1.year.ago, to: 1.year.from_now),
      drone: Drone.all.sample,
      user: User.all.sample
    )
    booking.save!
  end
end

puts "Creation of users"
new_users
puts "Creation of drones"
new_drones
puts "Creation of bookings"
new_bookings

puts "Seed done !"


# {
#   "brand": "DJI",
#   "models": [
#     "DJI Mavic Mini",
#     "DJI Mavic Air 2",
#     "DJI Phantom 4 Pro",
#     "DJI Inspire 2"
#   ]
# },
