require_relative '../date'

module Geonames
  module Params
    class Timezone < Base
      include Hashie::Extensions::Coercion

      property :radius
      property :date

      coerce_key :date, Geonames::Date

    end
  end
end
