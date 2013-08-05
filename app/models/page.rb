class Page < ActiveRecord::Base
  attr_accessible :slug, :hidden, :seo_id, :seo_attributes, :content,
                  :layout, :position, :parent_id, :name

  belongs_to :seo
  has_ancestry

  acts_as_list

  accepts_nested_attributes_for :seo, :allow_destroy => true, :reject_if => :all_blank

  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true
  validates :content, html: true

  extend FriendlyId
  friendly_id :slug

  before_validation :fill_slug

  default_scope order('position')
  scope :visible, -> { where(hidden: false) }
  scope :invisible, -> { where(hidden: true) }
  scope :without, (lambda do |field, values|
    raise "Unknown field :#{field} in Page model" unless field.to_s.in? attribute_names
    values = [values] unless values.is_a? Array
    where("#{field} NOT IN (?)", values)
  end)

  private

  def fill_slug
    self.slug = Russian::translit(name).parameterize if slug.blank? && name.present?
  end
end
