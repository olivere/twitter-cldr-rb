# encoding: UTF-8

# Copyright 2012 Twitter, Inc
# http://www.apache.org/licenses/LICENSE-2.0

module TwitterCldr
  module Formatters
    autoload :Base, 'twitter_cldr/formatters/base'

    autoload :DateTimeFormatter, 'twitter_cldr/formatters/calendars/datetime_formatter'
    autoload :DateFormatter,     'twitter_cldr/formatters/calendars/date_formatter'
    autoload :TimeFormatter,     'twitter_cldr/formatters/calendars/time_formatter'

    autoload :Numbers,           'twitter_cldr/formatters/numbers'
    autoload :NumberFormatter,   'twitter_cldr/formatters/numbers/number_formatter'
    autoload :DecimalFormatter,  'twitter_cldr/formatters/numbers/decimal_formatter'
    autoload :CurrencyFormatter, 'twitter_cldr/formatters/numbers/currency_formatter'
    autoload :PercentFormatter,  'twitter_cldr/formatters/numbers/percent_formatter'

    autoload :Plurals,         'twitter_cldr/formatters/plurals'
    autoload :PluralFormatter, 'twitter_cldr/formatters/plurals/plural_formatter'
  end
end