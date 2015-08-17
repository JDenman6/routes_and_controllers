class ContactShare < ActiveRecord::Base
  validates :contact_idUser, presence: true,
      :uniqueness => { :scope => :user_id }
  validates :user_id, presence: true

  belongs_to :contact

  belongs_to :owner,
  class_name: "User",
  foreign_key: :user_id,
  primary_key: :id

end
