class CreatePupils < ActiveRecord::Migration
  def change
    create_table :pupils do |t|

      t.timestamps null: false
    end
  end
end
