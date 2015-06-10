class AddCansToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :cans, :text
  end
end
