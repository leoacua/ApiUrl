Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Permitir solicitudes de todos los orígenes
      resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end