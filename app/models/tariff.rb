class Tariff < ActiveRecord::Base
  extend Enumerize

  attr_accessible :additional_price_cents, :cargo_kind, :price_cents, :weight_end,
                  :weight_start, :zone_id

  enumerize :cargo_kind, in: [:document, :goods], default: :document, predicates: true, scope: true

  belongs_to :zone

  validates :cargo_kind, presence: true

  scope :with_weight, ->(weight){ where("weight_start < :w AND weight_end >= :w", w: weight) }
end
