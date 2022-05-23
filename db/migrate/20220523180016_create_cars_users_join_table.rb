class CreateCarsUsersJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :cars, :users do |t|
      t.index :car_id
      t.index :user_id
    end
  end
end
