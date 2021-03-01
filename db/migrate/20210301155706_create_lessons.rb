class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :description
      t.string :is_done, default: false

      t.belongs_to :course

      t.timestamps
    end
  end
end
