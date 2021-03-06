# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Activity.destroy_all

frank = User.create( email: "frank@gmail.com", password: "food", password_confirmation: "food", name: "Frank Fermin", :first_name => 'nn', :last_name => 'yy', role: "vendor", image_url: "http://www.trbimg.com/img-522a6461/turbine/la-dd-chef-of-the-moment-frank-fermin-20130906-001/600", about: "I'm a chef in Los Angeles. You may know me from the awesome pizzas that I've made at Pizzeria Mozza!" )

cooking = Activity.create( vendor_id: 6, user_id: 6, name: "pizza making", image_url: "http://i1292.photobucket.com/albums/b561/parisliahyun/IMG_23731_zpsd37ad61f.jpg", description: "Learn the secret ingredients of yummy pizza from famed Mozza chef (and 'pie' lover), Frank Fermin.", vendor_id: 53)

# skateboarding = Activity.create( image_url: "http://i1292.photobucket.com/albums/b561/parisliahyun/IMG_23731_zpsd37ad61f.jpg", description: "cooking!" )

code = Activity.create(vendor_id: 6, user_id: 6, name: "learn to code", image_url: "http://cdni.wired.co.uk/620x413/a_c/coding.jpg", description: "For budding hackers.", vendor_id: 53)

makeup = Activity.create(vendor_id: 6, user_id: 6, name: "makeup!", image_url: "http://edanafashion.files.wordpress.com/2013/03/a11.jpg?w=620", description: "Makeup! And yes. We will end with music, snacks and a runway show.", vendor_id: 53)

pirate = Activity.create(vendor_id: 6, user_id: 6, name: "sail like a pirate", image_url: "http://drohm.nl/kinderenaanboord/uploads/afbeeldingen/Sailing%20Kids%20Meridiaan.jpg", description: "Play and plunder! Learn how pirates navigate the stars. Physics, geometry and scallywaggardry taught by a real-life retired pirate (and Cal Tech professor) in Venice Beach.", vendor_id: 53)

negotiate = Activity.create(vendor_id: 6, user_id: 6, name: "Young moguls", image_url: "http://4.bp.blogspot.com/-u6pLphFdy3o/TpuEoklgM3I/AAAAAAAAAFI/BIk9vFQhqD0/s1600/business-child-kid-computer-intern.jpg", description: "Bossy pants 101. The art of wheeling and dealing, such as, negotiation skills you can use on chore day.", vendor_id: 53)

magic = Activity.create(vendor_id: 6, user_id: 6, name: "magic!", image_url: "http://www.clker.com/cliparts/8/a/0/a/1195424618541325975johnny_automatic_linking_rings.svg.med.png", description: "Ta-dah! Learn magic tricks from Houdini's great, great, great grandson's neighbor's cousin, Jeff!", vendor_id: 53)
