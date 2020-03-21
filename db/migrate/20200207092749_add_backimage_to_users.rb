class AddBackimageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :backimage, :string
  end
end
