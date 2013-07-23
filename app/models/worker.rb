class Worker < ActiveRecord::Base
  attr_accessible :first_name, :job, :last_name, :logo, :phone, :th_name

  mount_uploader :photo, PhotoUploader

  attr_accessible :photo

  validates :first_name, :last_name, :th_name, :job, presence: true
end
