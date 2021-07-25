class User < ApplicationRecord
    has_secure_password

    has_many :conversations

    validates_presence_of :name, :phone, :password_digest
end
