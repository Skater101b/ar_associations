class CreateCarAndFactoryJoin < ActiveRecord::Migration[5.2]
  def change
    create_table :cars_and_factories, id: false do |t|
      t.integer 'car_id'
      t.integer 'factory_id'
    end
    add_index("cars_and_factories", ['car_id', 'factory_id'])
  end
end
