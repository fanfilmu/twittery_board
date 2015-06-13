class AddTweetIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tweet_id, :string
  end
end
