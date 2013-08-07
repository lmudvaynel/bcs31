class Zone < ActiveRecord::Base
  extend Enumerize

  attr_accessible :name, :provider

  enumerize :provider, in: [:bcs, :major_express], predicates: true, scope: true

  belongs_to :delivery_city_relation
  has_many :tariffs

  validates :name, presence: true, uniqueness: { scope: :provider }

  def tariff(weight, cargo_kind)
    tt = tariffs.with_cargo_kind(cargo_kind)
    tt.with_weight(weight).first || tt.order('weight_end ASC').last
  end
end
