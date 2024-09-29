class Inventory < ApplicationRecord
    belongs_to :character
    belongs_to :artifact
end
