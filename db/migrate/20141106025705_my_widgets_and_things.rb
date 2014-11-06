class MyWidgetsAndThings < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :name
      t.string :description
      t.integer :age
    end
  end
end
