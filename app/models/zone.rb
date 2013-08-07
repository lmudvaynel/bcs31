class Zone < ActiveRecord::Base
  extend Enumerize

  attr_accessible :name, :provider, :tariffs_attributes

  enumerize :provider, in: [:bcs, :major_express], predicates: true, scope: true

  has_many :zone_delivery_relations
  has_many :delivery_city_relations, through: :zone_delivery_relations
  has_many :tariffs

  accepts_nested_attributes_for :tariffs

  validates :name, presence: true, uniqueness: { scope: :provider }

  def tariff(weight, cargo_kind)
    tt = tariffs.with_cargo_kind(cargo_kind)
    tt.with_weight(weight).first || tt.order('weight_end ASC').last
  end
end
