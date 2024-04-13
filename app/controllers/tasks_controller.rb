class TasksController < ApplicationController
  def fetch_earthquake_data_task
    # Cargar todas las tareas de Rake definidas en la aplicación
    Rails.application.load_tasks
    # Llamar directamente a la tarea de rake desde Ruby
    Rake::Task['fetch_earthquake_data_task:perform'].invoke

    # O si prefieres utilizar Active Job, puedes encolar el trabajo asíncronamente
    # EarthquakeDataFetcherJob.perform_later

    # Responder con un mensaje de éxito o cualquier otra respuesta apropiada
    render json: { message: 'La tarea fetch_earthquake_data_task se ha ejecutado exitosamente' }
  rescue => e
    # Manejar cualquier error que pueda ocurrir durante la ejecución de la tarea
    render json: { error: 'Se produjo un error al ejecutar la tarea: ' + e.message }, status: :internal_server_error
  end
end