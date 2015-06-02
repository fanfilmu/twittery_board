class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer  :user_id
      t.string   :tweet_id
      t.text     :content
      t.string   :author
      t.datetime :published_at

      t.timestamps
    end
  end
end
