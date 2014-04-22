#coding: utf-8

class City < ActiveRecord::Base
  attr_accessible :affiliate, :central, :district_level, :name, :region_id

  belongs_to :region

  has_many :delivery_city_relations, foreign_key: :city_from_id
  has_many :cities_of_delivery, through: :delivery_city_relations, source: :city_to

  validates :name, presence: true, uniqueness: true

  def provider_for(city, pay_in_affiliate)
    (self.affiliate? or city.affiliate? and pay_in_affiliate) ? :bcs : :major_express
  end
  
  def zone_to(city, pay_in_affiliate)
    provider = provider_for(city, pay_in_affiliate)
    zones = delivery_city_relations.where(city_to_id: city.id).first.try(:zones)
    if zones
      zones.with_provider(provider).first
    end
  end

  def delivery_price_to(city, weight, pay_in_affiliate)
    zone = self.zone_to(city, pay_in_affiliate)
    cents = 0
    if zone
      tariff = zone.tariff(weight)
      if tariff
        cents = tariff.price_cents
        if weight > tariff.weight_end
          cents += tariff.additional_price_cents * (weight - tariff.weight_end).ceil
        end
        cents *= 1.5 if zone.provider == 'bcs' and !self.affiliate?
      end
    end
    cents
  end
end
