class CreateTweet < ActiveRecord::Migration

  def change
    create_table :tweets do |t|
      t.datetime   :created_at
      t.text       :text
      t.string     :id_str, index: true

      t.references :user, index: true
    end
  end

end
