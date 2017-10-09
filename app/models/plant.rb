class Plant < ApplicationRecord
  has_attachments :photos, maximum: 5
end
