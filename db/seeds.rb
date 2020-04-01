# Here is where I will create some seed data to work with and test associations

# Create 2 users

latricia = User.create(name: "Latricia", email: "Latricia@Latricia.com", password: "password")
tricia = User.create(name: "tricia", email: "tricia@tricia.com", password: "password")

# Create some Gratitude entries

GratitudeEntry.create(content: "I am thankful for my job", user_id: latricia.id)

# Use Activerecord to pre-associate data:
latricia.gratitude_entries.create(content: " I am building using sinatra")