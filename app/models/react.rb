class React < ApplicationRecord
  enum reaction: %i[agree love disagree]
  belongs_to :reactable, polymorphic: true
  belongs_to :user
end
