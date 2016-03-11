class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :name
      t.float :amount
      t.integer :number
      t.date :date

      t.timestamps
    end
  end
end
