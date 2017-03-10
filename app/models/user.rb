class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_in_printing_hubs
  has_many :printing_hubs, through: :user_in_printing_hubs
  has_many :printers, through: :printing_hubs
  has_many :shipping_types, through: :printing_hubs
  has_many :printing_sets, through: :printing_hubs
  has_many :printables, through: :printing_sets
  has_many :orders
  has_many :cart_items

  def has_printer printer
    return printers.exists?(id: printer)
  end

  def has_cart_item cart_item
    return cart_items.exists?(id: cart_item)
  end

  def has_shipping_type shipping_type
    return shipping_types.exists?(id: shipping_type)
  end

  def has_printable printable
    return printables.exists?(id: printable)
  end

  def has_printing_hub printing_hub
    return printing_hubs.exists?(id: printing_hub)
  end

  def has_printing_set printing_set
    return printing_sets.exists?(id: printing_set)
  end
end
