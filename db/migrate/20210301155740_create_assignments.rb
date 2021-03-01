class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.string :content_type
      t.string :content_url
      t.string :is_done, default: 0

      t.belongs_to :lesson

      t.timestamps
    end
  end
end
