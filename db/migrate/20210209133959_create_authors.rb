class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :age
      t.text :description
      t.belongs_to :city, index: true
      t.string :password_digest
      t.timestamps
    end
  end
end
