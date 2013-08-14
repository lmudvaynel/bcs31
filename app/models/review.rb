class Review < ActiveRecord::Base
  attr_accessible :city, :company_name, :content, :first_name, :last_name, :logo, :moderated, :email

  mount_uploader :logo, ReviewLogoUploader

  validates :first_name, :content, presence: true
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

  scope :moderated, -> { where(moderated: true) }

  def name
    "#{first_name}#{' ' + last_name if last_name.present?}"
  end

  def caption
    "#{name}#{', ' + city if city.present?}"
  end
end