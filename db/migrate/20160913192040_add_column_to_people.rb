class AddColumnToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :first_name, :string
  end
end
