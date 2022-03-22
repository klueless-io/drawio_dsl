KManager.action :parking_app do
  action do

    DrawioDsl::Drawio
      .init(k_builder, on_exist: :write, on_action: :execute)
      .diagram(theme: :style_04)
      .page('Domain Modal', margin_left: 0, margin_top: 0, rounded: 0, background: '#fafafa') do
        grid_layout(wrap_at: 6)

        # Two apps in the market for parking currently do the following:
        # 
        # Allow an officer to see if a car is parked legally or not
        # Officer can book the car and if it is parked illegally
        # Officer can print out the penalty infringement notice (PIN)
        # The vehicle operator (driver) can use the app to buy a ticket for a parking space
        #
        # System is integrated with State Debt Recovery System
        #
        # Two actors involved:
        # Officer will book illegal cars
        #  - An officer can be a: Parking cop, Police officer, Ranger or parking station attendant.
        #  - Examples of parking station attendants include, McDonald'se, Wilsons Car Park, etc. (limited GEO fence)
        # The vehicle operator will pay the ticket for parking space
        #
        # What can be booked? Anything that is a registered vehicle.
        #   - Truck, Bus, Car, Motorcycle, Trailer, etc.
        #   - They all have a number plate.
        # 
        # Goal is to build a better app

        # What is wrong with the current apps?
        #
        # When I book a car, I say it is outside of house #5, Bondi road.

        # What can be improved?
        #
        # AI can be used to detect the vehicle definition.

        actor2(title: 'Officer', description: 'Officer can book illegal cars')
        actor2(title: 'Vehicle operator', description: 'vehicle operator can buy a ticket for a parking space')

        # square

        # should there be vehicle, the definition.
        # should there be vehicle, the instance of the definition.

        klass do # table in the database
          format
            .header('Vehicle', description: 'Any vehicle with a registration number plate, Truck, Bus, Car, Motorcycle, Trailer')
            .field(:make)
            .field(:model)
            .field(:type) # Bus, Sedan, Station Wagon, 4WD, Motorcycle, Trailer, Caravan, Car+Caravan, Van etc.
            .field(:registration_number)
            .field(:heavy_vehicle)
        end

        klass do
          format
            .header('Chalk', description: 'Noting that a vehicle is parked at a specific time and location')
            .field(:date_time)          # 9am (from chalk)
            .field(:vehicle)
            .field(:location_geo_long)  # , value: '-33.8425248')
            .field(:location_geo_lat)   # , value: '151.2054196')
        end

        klass do
          format
            .header('Pin', description: 'Penalty infringement notice (PIN)')
            .field(:date_time)
            .field(:vehicle)
            .field(:location_address)                 # can AI be used auto suggest to populate this field, and then the officer can alter if needed.
            .field(:location_geo_long)                #, value: '-33.8425248')
            .field(:location_geo_lat)                 #, value: '151.2054196')
            .field(:location_photo)
            .field(:photos)
            .field(:offense_chalk_time)               # 9am (from chalk)
            .field(:offense_offence_limit_time)       # 2 hours - has to be after chalk time (and is based on signage)
            .field(:offense_pin_time)                 # has to be after offense limit time
        end

        # square(title: 'Schema/virtual', theme: :style_01)
        # diamond(title: 'anchor')

        # klass do
        #   format
        #     .header('Container', description: 'A container acts a base data object for any data that requires tagging')
        # end
        # square(title: 'Documents', theme: :style_01)
        # interface(theme: :style_02) do
        #   format
        #     .header('Block Processor', interface_type: 'MixIn', description: 'Provide data load events, dependency and import management')
        #     .field(:block, type: :proc)
        #     .field(:block_state, type: :symbol)
        #     .method(:depend_on)
        # end
      end
      .cd(:docs)
      .save('parking_app.drawio')
      .export_svg('parking_app', page: 1)
  end
end

KManager.opts.app_name                    = 'domain_diagram'
KManager.opts.sleep                       = 2
KManager.opts.reboot_on_kill              = 0
KManager.opts.reboot_sleep                = 4
KManager.opts.exception_style             = :short
KManager.opts.show.time_taken             = true
KManager.opts.show.finished               = true
KManager.opts.show.finished_message       = 'FINISHED :)'
