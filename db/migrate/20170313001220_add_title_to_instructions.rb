class AddTitleToInstructions < ActiveRecord::Migration[5.0]
  def change
    add_column :instructions, :title, :string
  end
end
