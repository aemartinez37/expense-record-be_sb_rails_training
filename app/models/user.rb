class User < ApplicationRecord
    validates :username, uniqueness: { message: "Username already taken" }, presence: { message: "Username is required" }
    validates :full_name, presence: { message: "Full name is required" }
    validates :email, uniqueness: { message: "Email already registered" } ,presence: { message: "Email is required" }
    has_many :expenses, dependent: :destroy
end
