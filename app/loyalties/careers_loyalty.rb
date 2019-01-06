# frozen_string_literal: true

class CareersLoyalty < ApplicationLoyalty
  def update?
    user.id == record.id
  end
end
