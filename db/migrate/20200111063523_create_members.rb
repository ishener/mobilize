class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :members, [:email], :unique => true
  end
end
