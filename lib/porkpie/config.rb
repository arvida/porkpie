module Porkpie
  class Config
    OPTIONS = {
      :host => '127.0.0.1',
      :port => 5432,
      :pid_file => '/var/run/porkpie.pid',
      :log_file => nil,
      :daemonize => nil
    }

    class << self

      OPTIONS.each do |option, default|
        define_method option do
          instance_variable_get("@#{option}") || default
        end
        define_method "#{option.to_s}=" do |value|
          instance_variable_set("@#{option}", value)
        end
      end

    end
  end
end
