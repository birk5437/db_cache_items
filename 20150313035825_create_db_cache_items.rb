class CreateDbCacheItems < ActiveRecord::Migration
  def change
    create_table :db_cache_items do |t|
      t.string :key
      t.text :value
      t.timestamps
    end
  end
end
