class AddColumnsToMessages < ActiveRecord::Migration[5.1]
    def change      
        change_table :messages do |t|
        t.remove :content
        t.text :body
        t.string :email
        t.string :token
        t.string :password
        end
    end
end
