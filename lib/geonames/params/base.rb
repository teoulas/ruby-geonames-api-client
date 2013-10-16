module Geonames
  module Params
    class Base < Hashie::Trash
      property :style
      property :lang
    end
  end
end
