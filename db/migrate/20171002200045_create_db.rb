class CreateDb < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
        t.text :body
        t.string :email
        t.string :token
        t.string :password_digest
        t.timestamp
    end
  end
end
