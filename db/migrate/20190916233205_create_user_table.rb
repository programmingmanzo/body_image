class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name 
      t.string :email
      t.string :password_digest #in order to encrypt the password (digest) 
    end
  end
end