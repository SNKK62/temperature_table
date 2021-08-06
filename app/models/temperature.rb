class Temperature < ApplicationRecord
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    validates :user_id, presence: true 
    validates :num, presence: true

    def self.add_temps
        @users = User.all
        @users.each do |user|
          user.temperatures.create(num: "未記入")
        end
      end
end
