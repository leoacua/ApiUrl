class CreateEarthquakes < ActiveRecord::Migration[7.1]
  def change
    create_table :earthquakes do |t|
      t.string :ids
      t.float :mag
      t.string :place
      t.bigint :time
      t.string :url
      t.integer :tsunami
      t.string :mag_type
      t.string :title
      t.string :feature_type
      t.float :geometry_longitude
      t.float :geometry_latitude
      t.float :geometry_altitude

      t.timestamps
    end
  end
end
