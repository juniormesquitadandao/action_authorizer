module ActionAuthorizer
  module Matcher

    def validate_length_of(attr)
      AuthorizeMatcher.new(attr)
    end

    class AuthorizeMatcher < ValidationMatcher

      def initialize(attribute)
        super(attribute)
        @options = {
          authenticated: attribute,
          action: nil
        }
      end

      def access(action)
        @options[:action] = action
        self
      end

      def with(params)
        @options[:params] = params
        self
      end

      def simple_description
        description = "authorize #{@authenticated}"

        description << " access #{@options[:action]}" if @options.key?(:show)
        description << " with #{@options[:params]}" if @options.key?(:params)

        description
      end

      def matches?(subject)
        super(subject)

        subject.class.new *@options.values
      end

      private

    end

  end
end