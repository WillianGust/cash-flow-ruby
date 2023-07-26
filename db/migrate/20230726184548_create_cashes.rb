class CreateCashes < ActiveRecord::Migration[7.0]
  def change
    create_table :cashes do |t|
      t.string :type, limit: 255
      t.float :value
      t.integer :status

      t.timestamps
    end
  end
end
