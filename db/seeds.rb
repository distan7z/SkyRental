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

DRONE_ANONYMOUS_DESCRIPTIONS = [
  "A compact quadcopter with a built-in camera for aerial photography.",
  "A foldable drone with a long battery life and obstacle avoidance sensors.",
  "A powerful hexacopter with advanced GPS tracking and stabilization features.",
  "A lightweight drone with a modular design and customizable payloads.",
  "A rugged quadcopter with thermal imaging capabilities for search and rescue missions.",
  "An agile drone with a 360-degree gimbal and real-time video transmission.",
  "A high-speed racing drone with customizable LED lights and FPV goggles.",
  "A waterproof quadcopter with a built-in air pump for underwater exploration.",
  "A professional-grade drone with a three-axis gimbal and 4K camera.",
  "A compact drone with gesture control and intelligent flight modes.",
  "A versatile quadcopter with swappable arms and a modular camera system.",
  "An industrial drone with a heavy payload capacity and long flight time.",
  "A mini drone with optical flow sensors and one-button takeoff and landing.",
  "A hybrid drone that can switch between fixed-wing and quadcopter modes.",
  "A stabilized drone with an anti-jello camera mount for smooth aerial footage.",
  "A drone with automatic obstacle avoidance and precision landing capabilities.",
  "A long-range quadcopter with a high-definition camera and real-time transmission.",
  "A lightweight drone with a 2-axis mechanical gimbal and active track mode.",
  "A drone with a brushless motor and high-performance electronic speed controller.",
  "An aerial robot with machine learning capabilities and advanced computer vision.",
  "A quadcopter with a foldable design and 4K camera for cinematic shots.",
  "A drone with a swiveling camera for capturing panoramic images and videos.",
  "A drone with a GPS tracker and autonomous flight modes for easy navigation.",
  "A drone with a high-strength carbon fiber frame and vibration dampening system.",
  "A drone with a 360-degree obstacle avoidance system and gesture recognition."
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
    i = rand(0..DRONE_BRANDS_MODELS.length-1)
    drone = Drone.new(
      brand: DRONE_BRANDS_MODELS[i][:brand],
      model: DRONE_BRANDS_MODELS[i][:model],
      description: DRONE_ANONYMOUS_DESCRIPTIONS.sample,
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
