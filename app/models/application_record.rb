class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  attachment :header_image
  enum gender: { Male: 0, Female: 1 }

end
