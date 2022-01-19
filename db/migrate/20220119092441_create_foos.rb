class CreateFoos < ActiveRecord::Migration[6.1]
  def change
    create_table :foos do |t|
      t.string :name
      t.references :edition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
