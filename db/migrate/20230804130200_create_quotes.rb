class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.string :first_name
      t.string :user_city
      t.string :user_number
      t.string :user_email
      t.string :selectedOption
      t.text :textArea

      t.timestamps
    end
  end
end
