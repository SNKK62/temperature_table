class User < ApplicationRecord
    has_many :temperatures, dependent: :destroy
    belongs_to :group
    default_scope -> { order(created_at: :asc) }
    validates :name, presence: true
    validates :group_id, presence: true

    
end
