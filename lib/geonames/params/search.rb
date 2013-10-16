module Geonames
  module Params
    class Search < Base
      property :q
      property :name
      property :name_equals
      property :name_startsWith
      property :maxRows
      property :startRow
      property :country
      property :countryBias
      property :continentCode
      property :adminCode1
      property :adminCode2
      property :adminCode3
      property :featureClass
      property :featureCode
      property :isNameRequired
      property :tag
      property :operator
      property :charset
      property :fuzzy
      property :east
      property :west
      property :north
      property :south
      property :orderby
    end
  end
end
