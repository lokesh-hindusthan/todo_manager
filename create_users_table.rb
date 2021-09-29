require './connect_db.rb'
connect_db!

ActiveRecord::Migration.create_table(:users) do |t|
  t.column :user_name, :text
  t.column :user_email, :text
  t.column :user_password, :text
end
