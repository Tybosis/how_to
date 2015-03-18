class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :content
      t.belongs_to :list, index: true

      t.timestamps null: false
    end
    add_foreign_key :steps, :lists
  end
end
