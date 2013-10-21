class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :filename
      t.integer :survey_id

      t.timestamps
    end
  end
end
