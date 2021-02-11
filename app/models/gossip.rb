class Gossip < ApplicationRecord

validates :title,
presence: true,
length:{ in:3..14}

validates :content,
presence: true

validates :date,
presence: true


belongs_to :author
#has_many :comments
end
