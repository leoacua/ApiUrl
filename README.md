# README

Este README normalmente documentaría los pasos necesarios para poner en marcha la aplicación.

Cosas que puedes querer cubrir: 

* Sistemas opertauvo window V.10 o superior 

* Versión de Ruby 
  Ruby 3.3.0

* Versión de Rails 
  Rails 7.1.3.2 

* Versión de Base De Datos 
  psql (PostgreSQL) 16.2


* Dependencias del sistema
 instlación 
 rails new ApiUrl --database=postgresql

 Se agregan las siguientes gemas al archivo Gemfile
  # Agregamos la gema 'pg' para PostgreSQL
  gem 'pg'

# agregamos la gema 'httparty'
  gem 'httparty'

# agregamos la gema 'rack-cors'
  gem 'rack-cors'

# agregamos la gema 'rake'
 gem 'rake' 

* Configuración y Creacion del API
  -rails generate controller Api::Earthquakes index show create update destroy
  -rails generate controller Api::Comments create update

* Creación de la base de datos

  Creacion de Modulo Earthquake
  rails generate model Earthquake ids:string mag:float place:string time:bigint url:string tsunami:integer mag_type:string title:string feature_type:string geometry_longitude:float geometry_latitude:float geometry_altitude:float
  rails db:migrate

  Creacion de Modulo Earthquake
   rails generate model Comment body:text earthquake:references
   rails db:migrate

* Inicialización de la base de datos

  adapter: postgresql
  encoding: unicode
  host: localhost
  username: postgres
  password: 

  development:
  <<: *default
  database: terre


* Cómo ejecutar el conjunto de pruebas
 Consume el api y la carga la base de datos 
1 - http://localhost:3000/fetch_earthquake_data 
 renderiza  toda la información de la BD en json  
2 - http://localhost:3000/api/earthquakes/
 renderiza la información de un item de BD en json con los comentarios
3 - http://localhost:3000/api/earthquakes/:id <- un numero 
 
end 