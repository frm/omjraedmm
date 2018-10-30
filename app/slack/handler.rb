module OMJRAEDMM::Slack
  class Handler
    class << self
      def perform(message)
        message = OMJRAEDMM::Slack::Message.new_if_valid(message)

        message.reply
      end
    end
  end
end
