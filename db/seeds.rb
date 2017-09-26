# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
=begin
User.create(:email => "jessebm@gmail.com",
            :password => "bicyclecheesesandwich",
            :current_sign_in_at => "2012-03-12 19:09:50",
            :last_sign_in_at => "2012-03-12 19:05:13",
            :current_sign_in_ip => "69.211.97.8",
            :last_sign_in_ip => "69.211.97.8",
            :created_at => "2011-12-02 22:25:46",
            :updated_at => "2012-03-12 19:09:50",
            :roles_mask => 1)
=end
User.create(:email => "d@example.com",
            :password => "bicyclecheesesandwich",
            :current_sign_in_at => "2012-03-13 22:32:56",
            :last_sign_in_at => "2012-03-13 04:30:01",
            :current_sign_in_ip => "68.53.177.91",
            :last_sign_in_ip => "68.53.177.91",
            :created_at => "2012-01-30 09:02:12",
            :updated_at => "2012-03-13 22:32:56",
            :roles_mask => 1)

