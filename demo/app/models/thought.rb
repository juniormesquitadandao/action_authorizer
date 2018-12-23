class Thought < ApplicationRecord
  include Reactable
  acts_as_commentable
  belongs_to :user
end
