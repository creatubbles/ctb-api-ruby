module Creatubbles
  module Error
    #Creatubbles::Error::RecordNotFound
    class RecordNotFound < StandardError
      attr_reader :original
      def initialize original
        @original = original
      end
    end
  end
end
