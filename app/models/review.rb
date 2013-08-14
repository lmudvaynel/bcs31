class Review < ActiveRecord::Base
  attr_accessible :city, :company_name, :content, :first_name, :last_name, :logo, :moderated, :email

  mount_uploader :logo, ReviewLogoUploader

  validates :first_name, :content, presence: true
  validates :email, presence: true, email: true

  scope :moderated, -> { where(moderated: true) }

  def name
    "#{first_name}#{' ' + last_name if last_name.present?}"
  end

  def caption
    "#{name}#{', ' + city if city.present?}"
  end
end