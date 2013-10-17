class Worker < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :job, :logo, :phone, :patronymic, :photo, :position

  acts_as_list

  mount_uploader :photo, PhotoUploader

  validates :first_name, :last_name, :job, presence: true

  def name
    "#{last_name} #{first_name}" + (" #{patronymic}" if :patronymic)
  end
end