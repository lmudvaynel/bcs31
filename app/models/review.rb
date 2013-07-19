class Review < ActiveRecord::Base
  attr_accessible :city, :company_name, :content, :first_name, :last_name, :logo, :moderated

  mount_uploader :logo, ReviewLogoUploader

  validates :first_name, :content, presence: true
  validates :company_name, presence: true, if: lambda { logo.to_s.present? }
  validates :logo, presence: true, if: lambda { company_name.present? }

  scope :moderated, -> { where(moderated: true) }

  def name
    "#{first_name}#{' ' + last_name if last_name.present?}"
  end

  def caption
    "#{name}#{', ' + city if city.present?}"
  end
end
