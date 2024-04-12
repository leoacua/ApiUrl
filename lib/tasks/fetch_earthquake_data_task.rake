# app/tasks/fetch_earthquake_data_task.rb
require 'json'
require 'httparty'

namespace :fetch_earthquake_data_task do
  desc "Obtener datos de terremotos del USGS y conservarlos en la base de datos"
  task perform: :environment do
    url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson"
    response = HTTParty.get(url)

    if response.success?
      data = JSON.parse(response.body)
      data['features'].each do |feature|
        attributes = feature['properties']
        coordinates = feature['geometry']['coordinates']
        
        # Validar datos
        next if attributes['ids'].nil? || attributes['mag'].nil? || attributes['place'].nil? || attributes['time'].nil? || attributes['url'].nil? || attributes['tsunami'].nil? || attributes['magType'].nil? || attributes['title'].nil? || coordinates.nil?

        # Buscar terremoto existente
        existing_earthquake = Earthquake.find_by(ids: attributes['ids'])
        
        # Crear nuevo terremoto si no existe
        unless existing_earthquake
          Earthquake.create!(
            ids: attributes['ids'],
            mag: attributes['mag'],
            place: attributes['place'],
            time: Time.at(attributes['time'] / 1000),
            url: attributes['url'],
            tsunami: attributes['tsunami'],
            mag_type: attributes['magType'],
            title: attributes['title'],
            feature_type: 'feature',
            geometry_longitude: coordinates[0],
            geometry_latitude: coordinates[1]
          )
        end
      end
      puts "Los datos del terremoto se obtuvieron y persistieron con éxito"
    else
      puts "No se pudieron recuperar los datos del terremoto: #{response.code}"
    end
  end
end