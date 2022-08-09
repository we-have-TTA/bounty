# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
USE_SEED = true
if USE_SEED
  p 'use seed'

  # Create fake User
  User.create_fake_users(10)

  # Create fake Post
  create_fake_posts(3)

  # Create fake Comment
  create_fake_comments(15)
else
  p 'not use seed'
end
