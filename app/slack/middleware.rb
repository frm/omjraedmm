module OMJRAEDMM::Slack
  class Middleware
    SLACK_ROUTE = "/slack".freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      return if slack_path?(request) && invalid_request?(request)

      @app.call(env)
    end

    private

    def invalid_request?(request)
      invalid_token?(request) || own_message?(request)
    end

    def slack_path?(request)
      request.fullpath.starts_with?(SLACK_ROUTE)
    end

    def invalid_token?(request)
      request.params["token"] != OMJRAEDMM.config(:slack, :token)
    end

    def own_message?(request)
      request.params["user_name"] == OMJRAEDMM.config(:slack, :bot_name)
    end
  end
end
