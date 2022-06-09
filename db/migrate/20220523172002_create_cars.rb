# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :make
      t.string :image
      t.string :model
      t.text :description

      t.timestamps
    end
  end
end
