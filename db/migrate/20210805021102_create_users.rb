class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :group, foreign_key: true
      t.timestamps
    end

    add_index :users, [:group_id, :created_at]
  end

  
end
