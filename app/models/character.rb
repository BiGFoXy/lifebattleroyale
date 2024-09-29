class Character < ApplicationRecord
    belongs_to :user
    has_many :inventories, dependent: :destroy
    has_many :artifacts, through: :inventories
end
