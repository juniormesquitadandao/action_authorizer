module ActionDispatch
  module Routing
    class Mapper

      def authorize!
        constraints ActionAuthorizer::Constraint.new do
          yield
        end
      end

    end
  end
end