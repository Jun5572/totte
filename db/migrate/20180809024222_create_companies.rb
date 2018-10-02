class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :staff
      t.string :url
      t.text :introduction
      t.integer :place_id
      t.string :thumbnail_id

      t.timestamps
    end
  end
end
