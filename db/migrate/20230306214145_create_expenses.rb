class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.date :spending_date, null: false
      t.text :description, null: false
      t.string :type, null: true
      t.decimal :value, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
