class CreateUser < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string   :id_str, index: true
      t.string   :name
      t.string   :screen_name
      t.datetime :created_at
    end
  end

end
