class Author < ApplicationRecord
  # Scopes
  scope :ordered, lambda { |attr, ad|
    if Author.column_names.include?(attr)
      order(ad.nil? || !(%w[asc desc].include? ad) ? attr : "#{attr} #{ad}")
    else
      order(ad.nil? || !(%w[asc desc].include? ad) ? :name : "name #{ad}")
    end
  }

  # Relations
  has_many :books
  has_and_belongs_to_many :libraries

  # Data validation
  validates :name, presence: true
end
