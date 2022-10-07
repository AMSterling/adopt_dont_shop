class AddImagePathToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :image_path, :string
  end
end
