# frozen_string_literal: true

class Employee < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: %r{\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\z} }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :careers
  accepts_nested_attributes_for :careers
end
