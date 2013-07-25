class Worker < ActiveRecord::Base
  attr_accessible :first_name, :job, :last_name, :logo, :phone, :patronymic, :photo

  mount_uploader :photo, PhotoUploader

  validates :first_name, :last_name, :patronymic, :job, presence: true
end