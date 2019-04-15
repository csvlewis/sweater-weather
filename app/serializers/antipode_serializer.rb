class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location_name
  attribute :forecast do |object|
    object.unit_price.to_s.insert(-3, '.')
  end
end
