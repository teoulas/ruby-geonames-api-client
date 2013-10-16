module Geonames
  class Date < ::Date
    def self.coerce(string)
      parse(string.to_s)
    end
  end
end
