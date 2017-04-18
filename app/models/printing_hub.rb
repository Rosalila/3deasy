class PrintingHub < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :user_in_printing_hubs
  has_many :users, through: :user_in_printing_hubs
  has_many :printing_sets
  has_many :printers
  has_many :shipping_types
  has_many :orders, through: :printing_sets
  has_many :cart_items
  has_many :orders

  def id_and_paramterized_name
    return self.id.to_s + "-" + self.name.parameterize
  end

  def has_printing_set printing_set
    return printing_sets.exists?(id: printing_set)
  end

  def discount_multiplier
    if !discount
      return 1
    end
    return 1.0-discount/100
  end
end
