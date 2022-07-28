class Province < ApplicationRecord
  has_many :districts

  def self.hash_province
    provinces = Province.all
    hash_province = {}
    provinces.map do |province|
      hash_province[province.name] = province.districts.pluck(:name)
    end

    hash_province
  end
end