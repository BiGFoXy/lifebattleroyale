class User < ApplicationRecord
    has_secure_password
    has_many :characters, dependent: :destroy
end
