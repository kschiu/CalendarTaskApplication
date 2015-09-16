class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"])
      exists_user = User.find_by(email: @user.email)
      if @user.persisted?
        if @user.sign_in_count == 0
          import_events(request.env["omniauth.auth"])
        end
        @user.sign_in_count = @user.sign_in_count + 1
        @user.save
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
        redirect_to tasks_url
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end

  def import_events(authorization)
    @auth = authorization
    @token = @auth["credentials"]["token"]
    client = Google::APIClient.new
    client.authorization.access_token = @token
    service = client.discovered_api('calendar', 'v3')
    @result = client.execute(
      :api_method => service.events.list,
      :parameters => {:calendarId => 'primary',
        :maxResults => 10,
        :singleEvents => true,
        :orderBy => 'startTime',
        :timeMin => Time.now.iso8601},
      :headers => {'Content-Type' => 'application/json'})

    @result.data.items.each do |event|
      e = Event.new()
      e.google_id = event.id
      e.summary = event.summary
      e.description = event.description
      e.status = event.status
      e.htmlLink = event.htmlLink
      e.startDate = event.start.date
      e.startDateTime = event.start
      e.endDate = event.end.date
      e.endDateTime = event.end
      e.save
    end
  end

end