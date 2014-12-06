class Simplelist < ActiveRecord::Base
  belongs_to :resume
  has_many :simplelistitems, dependent: :destroy

  accepts_nested_attributes_for :simplelistitems, update_only: true

  include Orderable

  after_initialize :default_values

  def default_values
    self.name ||= 'New Simple List'
    # may cause bug
    # self.simplelistitems << Simplelistitem.new() if self.simplelistitems.empty?
  end

  # short hand for simplelist_items
  def items
    return  self.simplelistitems
  end
  
  # return the partial name, with which this list is rendered with 
  def tpl_name
    return self.class.name.underscore
  end

  # return the data to be rendered (items of this lists)
  def data
    return self.simplelist_items
  end

end
