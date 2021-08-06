class CreateTemperatures < ActiveRecord::Migration[6.1]
  def change
    create_table :temperatures do |t|
      t.string :num
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :temperatures, [:user_id, :created_at]
  end
end
