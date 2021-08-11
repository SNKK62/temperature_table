class User < ApplicationRecord
    has_many :temperatures, dependent: :destroy
    belongs_to :group
    # default_scope -> { order(created_at: :asc) }

    acts_as_list scope: :group

    validates :name, presence: true
    validates :group_id, presence: true

    
end
