class AddDefaultToActive < ActiveRecord::Migration[5.1]
  def change
    change_column_default :lessons, :active, true
  end
end
