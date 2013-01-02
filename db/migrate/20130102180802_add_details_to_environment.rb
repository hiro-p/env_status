class AddDetailsToEnvironment < ActiveRecord::Migration
  def change
    add_column :environments, :details, :text
  end
end
