require 'exceptions'

module CoreRequest
  def make_request (uri, method, session, data={})
    data[:method] = method
    insert_common_headers(data)
    insert_auth_token(data, session)
    insert_locale(data)
    jsonify_body(data)
    url_params = data[:params] ? data[:params].to_query : ''
    data.delete(:params)
    response = Typhoeus::Request.new("#{CORE_CONFIG['location']}#{uri}?#{url_params}", data).run
    insert_parsed_body(response, data)
    set_messages_to_session(response, session)
    if response.code == 401
      raise UnauthorizedException
    end
    return response
  end

  private

  def jsonify_body(data)
    data[:body] = JSON.dump(data[:body]) if data[:body]
  end

  def insert_parsed_body(response, data)
    def response.parsed_body (&block)
      if block
        @parsed_body = block.call
      end
      @parsed_body
    end
    response.parsed_body do
      JSON.parse(response.body) if data[:headers][:Accept] == 'application/json'
    end
  end

  def set_messages_to_session(response, session)
    #session[:notice] = response.parsed_body['notice']
  end

  def insert_common_headers(data)
    data[:headers] = {} unless data[:headers]
    data[:headers][:Accept] = 'application/json' unless data[:headers][:Accept]
    data[:headers]["Content-Type"] = 'application/json' unless data[:headers]["Content-Type"]
  end

  def insert_auth_token(data, session)
    container = data[:method] == :get ? :params : :body
    if session[:auth_token]
      data[container] = {} unless data[container]
      data[container][:auth_token] = session[:auth_token]
    end
  end

  def insert_locale(data)
    container = data[:method] == :get ? :params : :body
    data[container] = {} unless data[container]
    data[container][:locale] = I18n.locale
  end
end
