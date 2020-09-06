@user = User.create(email: "test@test.com", 
                    password: "111111", 
                    password_confirmation: "111111", 
                    first_name: "sakura", 
                    last_name: "endo",
                    phone: "8508096008")

puts "1 User created"

AdminUser.create(email: "takator@yahoo.co.jp", 
                  password: "111111", 
                  password_confirmation: "111111", 
                  first_name: "tomoko", 
                  last_name: "ichikawa",
                  phone: "8508096008")

puts "1 Admin User created"

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

100.times do |audit_log|
  AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
end

puts "100 audit logs have been created"