class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.integer :follower
    	t.integer :following

      t.timestamps null: false
    end

    add_index :relationships, :follower
    add_index :relationships, :following
  end
end
