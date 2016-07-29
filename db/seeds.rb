# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')
# Create Users
users = YAML::load_file(Rails.root.join('db', 'data', 'users.yml'))
users.each do |user|
  current_user = User.where(email: user["email"]).first
  unless current_user.present?
    new_user = User.new(user)
    new_user.save!
  end
end
