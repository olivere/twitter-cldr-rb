# encoding: UTF-8

# Copyright 2012 Twitter, Inc
# http://www.apache.org/licenses/LICENSE-2.0

module TwitterCldr
  module Formatters
    module Plurals
      class Rules
        class << self
          def all
            all_for(TwitterCldr::get_locale)
          end

          def all_for(locale)
            locale = TwitterCldr.convert_locale(locale.to_sym)
            get_resource(locale)[locale][:i18n][:plural][:keys]
          rescue
            []
          end

          def rule_for(number, locale = TwitterCldr::get_locale)
            locale = TwitterCldr.convert_locale(locale.to_sym)
            get_resource(locale)[locale][:i18n][:plural][:rule].call(number)
          rescue
            :other
          end

          protected

          def get_resource(locale)
            locale = TwitterCldr.convert_locale(locale)
            eval(TwitterCldr.get_resource(locale, "plurals")[locale])
          end
        end
      end
    end
  end
end