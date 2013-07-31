class Worker < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :job, :logo, :phone, :patronymic, :photo

  mount_uploader :photo, PhotoUploader

  validates :first_name, :last_name, :patronymic, :job, presence: true

  def name
    "#{last_name} #{first_name}"
  end
end