module OMJRAEDMM::Slack
  class Message
    MESSAGE_FORMATS = [
      /^!mediamarkt/,
      /o mendes ja recebeu a encomenda da media markt\?*/i,
    ].freeze

    class << self
      def new_if_valid(message)
        new(message) if valid_format?(message["text"])
      end

      def valid_format?(message)
        MESSAGE_FORMATS.any? { |regex| regex.match?(message) }
      end
    end

    def initialize(message)
      @sender_id = "<@#{message['user_id']}>"
      @sender = message["user_name"]
    end

    def reply
      if OMJRAEDMM::Scraper.pending?
        "Nope, o mendes ainda não recebeu a encomenda da media markt"
      else
        "JÁÁÁÁ HOLY SHIT MENDES! ALGUÉM QUE TAGGE O MENDES. #{sender_id} TAGGA O MENDES QUE EU NÃO CONSIGO"
      end
    end

    private

    attr_reader :sender_id, :sender
  end
end
