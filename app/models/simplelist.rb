class Simplelist < ActiveRecord::Base
  belongs_to :resume
  has_many :simpleitems, dependent: :destroy
  liquid_methods  :template, :name, :items, :ordered_list

  # for mass update
  accepts_nested_attributes_for :simpleitems, update_only: true

  after_initialize :default_attributes

  include HasOrderableItems
  include HasTemplate

  def default_attributes
    self.name ||= 'New Simple List'
  end

  # shorthand for simpleitems
  def items
    return self.simpleitems.order(:order)
  end
end
