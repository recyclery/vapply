namespace :db do
  task :create_admins => :environment do |t|
    def create_admin(email)
      puts "Making user with email #{email} an admin."
      admin = User.first(:conditions => {:email => email})
      if admin
        admin.roles_mask = 1
        if admin.caseworker then admin.caseworker.destroy
        end
        if admin.save then puts "#{email} is now an admin."
        else puts "Process failed, #{email} is not an admin."
        end
      else puts "Process failed, No user has email #{email}."
      end
    end

    create_admin("jesse@therecyclery.org")
    create_admin("d@example.com")
    create_admin("andrea@therecyclery.org")
  end
end
