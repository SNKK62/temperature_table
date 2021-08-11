class Group < ApplicationRecord
    attr_accessor :remember_token

    has_many :users ,-> {order(position: :asc)}, dependent: :destroy
    validates :name, presence: true,uniqueness: true, allow_nil: true
    

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    def Group.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def Group.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = Group.new_token 
        update_attribute(:remember_digest, Group.digest(remember_token))
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end
end
