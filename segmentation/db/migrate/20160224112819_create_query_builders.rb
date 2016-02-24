class CreateQueryBuilders < ActiveRecord::Migration
  def change
    create_table :query_builders do |t|
      t.string :name
      t.string :condition

      t.timestamps null: false
    end
  end
end
