class AddTweetIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :tweet_id, :string
  end
end
