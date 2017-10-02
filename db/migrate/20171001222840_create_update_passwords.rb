class CreateUpdatePasswords < ActiveRecord::Migration[5.1]
  def change
    change_table :messages do |t|
        t.rename :password, :password_digest
    end
  end
end
