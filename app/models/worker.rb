class Worker < ActiveRecord::Base
  attr_accessible :name, :job, :logo, :phone, :patronymic, :photo

  mount_uploader :photo, PhotoUploader

  validates :name, :patronymic, :job, presence: true
end