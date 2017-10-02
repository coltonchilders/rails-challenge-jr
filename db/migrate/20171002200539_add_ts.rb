class AddTs < ActiveRecord::Migration[5.1]
  def change
    change_table :messages do |t|
      t.timestamps
    end
  end
end
