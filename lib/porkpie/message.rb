module Porkpie

  class Message

    attr_reader :message, :ez_key, :type, :name, :value

    def initialize message
      @message = message
      assign_values
    end

    def values
      message.split '%%'
    end

    private

    def assign_values
      @ez_key, @type, @name, @value = values
    end

  end

end
