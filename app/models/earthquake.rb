class Earthquake < ApplicationRecord
    validates :ids, presence: true
    validates :mag, numericality: { greater_than_or_equal_to: -Float::INFINITY }
    validates :place, presence: true
    validates :time, presence: true
    validates :url, presence: true
    validates :tsunami, inclusion: { in: [0,1] }
    validates :mag_type, presence: true
    validates :title, presence: true
    validates :feature_type, presence: true
    validates :geometry_longitude, presence: true, numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
    validates :geometry_latitude, presence: true, numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }


       # Relación para los comentarios
       has_many :comments, dependent: :destroy
  end