class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.string :usage
      t.text :comment

      t.timestamps
    end
  end
end
