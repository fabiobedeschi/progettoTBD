class Library < ApplicationRecord
  # Scopes
  scope :ordered, lambda { |attr, ad|
    ad = ad.nil? || !(%w[asc desc].include? ad) ? '' : ad
    if Library.column_names.include?(attr)
      order("#{attr} #{ad}")
    else
      joins(:user).order("users.username #{ad}")
    end
  }

  # Relations
  belongs_to :user, optional: false
  has_and_belongs_to_many :books
  has_and_belongs_to_many :authors

  # Data validation
  validates_presence_of :user
end
