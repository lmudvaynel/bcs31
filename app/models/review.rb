class Review < ActiveRecord::Base
  attr_accessible :city, :company_name, :content, :first_name, :last_name, :logo, :moderated

  mount_uploader :logo, ReviewLogoUploader

  validates :first_name, :content, presence: true

  scope :moderated, -> { where(moderated: true) }

  def name
    "#{first_name}#{' ' + last_name if last_name}"
  end

  def caption
    "#{name}#{', ' + city if city}"
  end
end
