require "httparty"

module WalmartOpen
  class Request
    attr_reader :path
    attr_reader :params

    def submit(config)
      parse_response(HTTParty.get(config.build_url(type, path, params), request_options))
    end

    def request_options
      { verify: false }
    end

    def type
      @type || :product
    end

    private

    # Subclasses can override this method to return a different response.
    def parse_response(response)
      response
    end
  end
end
