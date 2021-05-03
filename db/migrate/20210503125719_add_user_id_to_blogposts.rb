class AddUserIdToBlogposts < ActiveRecord::Migration[6.1]
  def change
    add_column :blogposts, :user_id, :integer
  end
end
