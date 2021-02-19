class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :number
      t.string :comment

      t.timestamps
    end
  end
end
