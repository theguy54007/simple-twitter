namespace :dev do
  # 請先執行 rails dev:fake_user，可以產生 20 個資料完整的 User 紀錄
  # 其他測試用的假資料請依需要自行撰寫
  task fake_user: :environment do
    User.where(role: nil).delete_all
    20.times do |i|
      name = FFaker::Name::first_name
      file = File.open("#{Rails.root}/public/avatar/user#{i+1}.jpg")

      user = User.new(
        name: name,
        email: "#{name}@example.co",
        password: "12345678",
        introduction: FFaker::Lorem::sentence(30),
        avatar: file
      )

      user.save!
      puts user.name
    end
  end

  task fake_tweet: :environment do
  Tweet.delete_all
  User.all.each do |user|
    3.times do |i|
      user.tweets.create!(
      description: FFaker::Lorem.sentence
      )
    end
  end
    puts "have created fake tweets"
    puts "now you have #{Tweet.count} tweets"

  end

  task fake_followship: :environment do
    Followship.delete_all
    User.all.each do |user|
      30.times do |i|
        following = User.all.sample
        if not user.is_following?(following)
          user.followships.create!(
          following: following
        )
        user.followers_count += 1
        end
      end
    end
     puts "now you have #{Followship.count} data created"
   end

   task fake_like: :environment do
     Like.delete_all
     Tweet.all.each do |tweet|
       30.times do |i|
         like = User.all.sample
         if not tweet.is_liked?(like)
           tweet.likes.create!(
           user:  like
         )
         tweet.likes_count += 1

         end
       end
     end
      puts "now you have #{Like.count} data created"
    end

    task fake_reply: :environment do
    Reply.delete_all
    Tweet.all.each do |tweet|
      3.times do |i|
        tweet.replies.create!(
        comment: FFaker::Lorem.sentence(8),
        user: User.all.sample)
      end
    end

      puts "now you have #{Reply.count} tweets"

    end






end
