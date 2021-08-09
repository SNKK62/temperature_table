class AddRememberDigestToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :remember_digest, :string
  end
end
