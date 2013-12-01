module Motion
  class Distance
    attr_accessor :activity_type, :accuracy

    def get(&block)
      @callback = block
      @total = 0
      location_manager.startUpdatingLocation
    end

    def stop_updating
      location_manager.stopUpdatingLocation

      @total_distance = 0
      @last_location = nil
      @callback = nil
    end

    def locationManager(locationManager, didUpdateLocations: locations)
      locations.each do |location|
        if location.horizontalAccuracy <= 5.0
          @total += location.distanceFromLocation(@last_location)
          @last_location = location
          response = { total: @total, location: location }

          @callback.call response
        end
      end
    end

    def locationManager(locationManager, didFailWithError: error)
      response = { error: error }

      @callback.call response
      stop_updating
    end

    def location_manager
      @location_manager ||=
        begin
          manager = CLLocationManager.alloc.init
          manager.desiredAccuracy = self.accuracy ||= KCLLocationAccuracyBest
          manager.activityType = self.activity_type || CLActivityTypeOther
          manager.delegate = self
          manager
        end
    end
  end
end
