class RemoveTagsFromBlogposts < ActiveRecord::Migration[6.1]
  def change
    remove_column :blogposts, :tags, :text
  end
end
