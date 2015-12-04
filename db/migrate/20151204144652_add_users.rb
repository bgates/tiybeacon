class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :github
    end
    create_table :attendances do |t|
      t.references :user
      t.timestamps
    end
  end
end
