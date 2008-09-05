module Castronaut

  class TicketResult
    
    attr_reader :ticket, :error_message
        
    def initialize(ticket, error_message=nil)
      @ticket = ticket
      @error_message = error_message
      $cas_config.logger.info("#{self.class} - #{@error_message} for #{@ticket}") if @error_message && @ticket
    end
    
    def username
      ticket.username if ticket && ticket.respond_to?(:username)
    end

    def valid?
      error_message.nil?
    end
  end

end
