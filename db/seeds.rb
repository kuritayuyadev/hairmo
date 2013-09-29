# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"

CSV.foreach('db/cosmeticians.csv') do |row|
    Cosmetician.create(:name => row[1], :email => row[2],
                :password => row[3], :salon_name => row[4], :area_id => row[5], :salon_address => row[6], :created_at => row[7], :updated_at => row[8])
end
