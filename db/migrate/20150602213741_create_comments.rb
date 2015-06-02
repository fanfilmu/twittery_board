class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.text       :content
      t.belongs_to :commentable, polymorphic: true

      t.timestamps
    end

    add_index :comments, [ :commentable_id, :commentable_type ]

    add_foreign_key :comments, :users
  end
end
