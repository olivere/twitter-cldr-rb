# encoding: UTF-8

# Copyright 2012 Twitter, Inc
# http://www.apache.org/licenses/LICENSE-2.0

module TwitterCldr

  module LocalizedNumberMixin
    def localize(locale = TwitterCldr.get_locale)
      TwitterCldr::LocalizedNumber.new(self, locale)
    end
  end

  class LocalizedNumber < LocalizedObject
    TYPES = [:decimal, :currency, :percent]
    DEFAULT_TYPE = :decimal

    attr_reader :type

    def initialize(obj, locale, options = {})
      @options = options.dup

      @type = @options.delete(:type) || DEFAULT_TYPE
      raise ArgumentError.new("type #{@type} is not supported") unless @type && TYPES.include?(@type.to_sym)

      super(obj, locale, @options)
    end

    TYPES.each do |type|
      define_method "to_#{type}" do
        to_type(type)
      end
    end

    def to_s(options = {})
      options = { :precision => 0 }.merge(options) if @base_obj.is_a?(Fixnum)
      @formatter.format(@base_obj, options)
    end

    def plural_rule
      TwitterCldr::Formatters::Plurals::Rules.rule_for(@base_obj, @locale)
    end

    protected

    def formatter_const
      TwitterCldr::Formatters.const_get("#{@type.to_s.capitalize}Formatter")
    end

    def to_type(target_type)
      self.class.new(@base_obj, @locale, @options.merge(:type => target_type))
    end
  end

end