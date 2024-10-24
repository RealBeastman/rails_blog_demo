class ChangeBodyForPosts < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :body, :string
  end
end
