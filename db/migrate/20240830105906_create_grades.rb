class CreateGrades < ActiveRecord::Migration[7.1]
  def change
    create_table :grades do |t|
      t.integer :number
      t.string :letter
      t.integer :students_count
      t.belongs_to :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
