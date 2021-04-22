class AddTagsToBlogposts < ActiveRecord::Migration[6.1]
  def change
    add_column :blogposts, :tags, :text
  end
end
