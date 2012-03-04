class CreateTagrelations < ActiveRecord::Migration
  def change
    create_table :tagrelations do |t|
      t.integer :post_id
      t.integer :tag_id
      
      t.timestamps
    end
    
    add_index :tagrelations, :post_id
    add_index :tagrelations, :tag_id
    add_index :tagrelations, [:post_id, :tag_id], :unique => true
  end
end
