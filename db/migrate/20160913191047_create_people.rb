class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    rename_table :first_names, :people

  end
end
