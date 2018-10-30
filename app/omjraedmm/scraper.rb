module OMJRAEDMM
  class Scraper
    MEDIA_MARKT_ORDER_URL = ENV["ORDER_URL"].freeze
    MEDIA_MARKT_PENDING_TEXT = "Aceitámos a tua encomenda e estamos a prepará-la. Regressa a esta página para receber atualizações sobre o estado do teu envio.".freeze

    class << self
      def pending?
        order_page.include?(MEDIA_MARKT_PENDING_TEXT)
      end

      private

      def order_page
        HTTParty.get(MEDIA_MARKT_ORDER_URL).body
      end
    end
  end
end
