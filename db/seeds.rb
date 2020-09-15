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
  Post.create!(date: Date.today, rationale: "#{post} rationale content　隙間を大事にして　ゆっくり生きて行きたい一日のその意味合いを
確かめて前に進む　時計の針と違う
感情が移ろい行く流れを眺めていたい
人生は　そんな急ぐものじゃないんだね", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"

AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 20.days))

puts "3 audit logs have been created"