class DropPeepsAgain < ActiveRecord::Migration[5.1]
  def change
    drop_table :people do |t|
      t.string :name
    end
  end
end
