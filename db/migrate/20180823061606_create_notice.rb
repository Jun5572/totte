class CreateNotice < ActiveRecord::Migration[5.2]
  def change
    create_table :notices do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notice_by, index: true
      t.references :photo, index: true, foreign_key: true
      t.string :notice_type
      t.boolean :read, default: false
    end
    add_foreign_key :notices, :users, column: :notice_by_id
  end
end
