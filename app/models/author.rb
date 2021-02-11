class Author < ApplicationRecord
    

# validates :password_digest,
    # presence: true,
    # length:{ in:6..15}


    has_secure_password

    belongs_to :city
    has_many :gossips
    #has_many :comments
end
