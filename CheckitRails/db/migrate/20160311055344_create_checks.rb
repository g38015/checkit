class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :date
      t.string :number
      t.string :amount
      t.string :name

      t.timestamps
    end
  end
end
