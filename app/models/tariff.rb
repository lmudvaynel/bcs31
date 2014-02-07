class Tariff < ActiveRecord::Base
  extend Enumerize

  attr_accessible :additional_price_cents, :price_cents, :weight_end, :weight_start, :zone_id

  belongs_to :zone

  scope :with_weight, ->(weight){ where("weight_start < :w AND weight_end >= :w", w: weight) }
end
