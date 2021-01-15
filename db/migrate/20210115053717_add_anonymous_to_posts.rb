class AddAnonymousToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts,:anonymous_check,:boolean
  end
end
