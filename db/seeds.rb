@user = User.create(email: "test@test.com", password: "111111", password_confirmation: "111111", first_name: "sakura", last_name: "endo")
puts "1 User created"

AdminUser.create(email: "takator@yahoo.co.jp", password: "111111", password_confirmation: "111111", first_name: "tomoko", last_name: "ichikawa")

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "100 Posts have been created"