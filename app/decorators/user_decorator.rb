module UserDecorator
  delegate :name, to: :prefecture, prefix: true, allow_nil: true
end
