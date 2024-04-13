
class TasksController < ApplicationController
  def fetch_earthquake_data_task
  # Rake::Task['fetch_earthquake_data_task:perform'].invoke
  system('rake fetch_earthquake_data_task:perform')

    # Por ejemplo, puedes llamar a un método en un modelo específico que maneje la lógica de la tarea.
    # Aquí solo proporciono un ejemplo básico:
    #EarthquakeDataFetcher.fetch_data
    
    # Responder con un mensaje de éxito o cualquier otra respuesta apropiada
    render json: { message: 'La tarea fetch_earthquake_data_task se ha ejecutado exitosamente' }
  end
end