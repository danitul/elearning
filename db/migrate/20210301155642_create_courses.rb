class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :status, default: 0

      t.belongs_to :user

      t.timestamps
    end
  end
end
