module EventsHelper

  class GoogleCalWrapper
    def initialize(current_user, event)
      configure_client(current_user)
      create_event(event)
    end

    def configure_client(current_user)
      @client = Google::APIClient.new
      @client.authorization.access_token = current_user.token
      @client.authorization.refresh_token = current_user.refresh_token
      @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
      @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
      @client.authorization.refresh!
      @service = @client.discovered_api('calendar', 'v3')
    end

    def calendar_id(event)
      response = @client.execute(api_method:@service.calendar_list.list)
      calendars = JSON.parse(response.body)
      calendar = calendars["items"].select {|cal| cal["summary"].downcase == event.downcase}
      calendar[0]["id"]
    end

    def create_event(event)
      cal_id = calendar_id(event.location)
      start_time = (event.date + (event.start_time).seconds_since_midnight.seconds).to_formatted_s(:iso8601)
      end_time = (event.date + event.end_time.seconds_since_midnight.seconds).to_formatted_s(:iso8601)
      event_info = {
        summary: event.name,
        location: event.location,
        start: {dateTime: start_time},
        end: {dateTime: end_time},
        description: event.description,
      }
      response = @client.execute(:api_method => @service.events.insert,
      :parameters => {'calendarId' => cal_id,
        'sendNotifications' => true},
        :body => JSON.dump(event_info),
        :headers => {'Content-Type' => 'application/json'})
    # TODO: Catch Errors
    end
  end
end
