class Expense < ApplicationRecord
  validates :spending_date, presence: { message: "Spending date is required" }
  validates :description, presence: { message: "Description is required" }
  validates :value, presence: { message: "Value is required" }, numericality: { greater_than: 0, message: "Value must be greater than 0" }
  belongs_to :user
end
