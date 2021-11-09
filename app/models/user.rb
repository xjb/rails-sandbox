class User < ApplicationRecord
  belongs_to :prefecture

  enum role: { administrator: 0, manager: 1, supporter: 2, customer: 3, guest: 9 }
end
