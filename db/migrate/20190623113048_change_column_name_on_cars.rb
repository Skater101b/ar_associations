class ChangeColumnNameOnCars < ActiveRecord::Migration[5.2]
  def change
    rename_column(:cars, "type", "brand")
  end
end
