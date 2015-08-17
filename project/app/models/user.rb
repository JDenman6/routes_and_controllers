class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :user_name, uniqueness: true

  has_many :contacts, dependent: :destroy

  has_many :contact_shares, dependent: :destroy

  has_many :shared_contacts,
  through: :contact_shares,
  source: :contact

end
