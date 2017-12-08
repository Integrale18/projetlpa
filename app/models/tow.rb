class Tow < ActiveRecord::Base
  before_validation :loadposition
  validates :lat, :lon, presence: true
  public 
  
  def loadposition
    places = Nominatim.search(name).limit(1)
    if places.first
      self.lat = places.first.lat
      self.lon = places.first.lon
    end
  end
end
