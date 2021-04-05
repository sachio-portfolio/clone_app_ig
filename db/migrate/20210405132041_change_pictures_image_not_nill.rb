class ChangePicturesImageNotNill < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pictures, :image, false
  end
end
