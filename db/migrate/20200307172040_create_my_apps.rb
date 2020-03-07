class CreateMyApps < ActiveRecord::Migration[6.0]
  def change
    create_table :my_apps do |t|
      t.string :name

      t.timestamps
    end
  end
end
