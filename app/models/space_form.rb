class SpaceForm
  include ActiveModel::Model
  attr_accessor(
    :info, :space_name, :space_name_kana, :length, :width, :size, :height, :fee_morning, :fee_day, :fee_night, :image, :studio_id,
    :id, :created_at, :datetime, :updated_at, :datetime
  )

  with_options presence: true do
    validates :image
    validates :info, length: { maximum: 99, message: 'is too long' }
    validates :space_name
    validates :space_name_kana, format: { with: /\A[ぁ-んー－]+\z/ }
    with_options numericality: { greater_than: 0, less_than: 2500, message: 'is invalid' } do
      validates :length
      validates :width
      validates :size
      validates :height
    end
    with_options numericality: { only_integer: true, greater_than_or_equal_to: 0, message: 'is invalid' } do
      validates :fee_morning
      validates :fee_day
      validates :fee_night
    end
    validates :studio_id
  end

  def save
    Space.create(info: info, space_name: space_name, space_name_kana: space_name_kana, length: length, width: width, size: size,
                 height: height, fee_morning: fee_morning, fee_day: fee_day, fee_night: fee_night, image: image, studio_id: studio_id)
  end

  def update(params, space)
    space.update(params)
  end

  # def initialize(attributes = nil, space: Space.new)
  #  @space = space
  #  attributes ||= default_attributes
  #  super(attributes)
  # end

  # attr_reader :space

  # def default_attributes
  # {
  #  info: space.info,
  #  space_name: space.space_name,
  #  space_name_kana: space.space_name_kana,
  #  length: space.length,
  #  width: space.width,
  #  size: space.size,
  #  height: space.height,
  #  fee_morning: space.fee_morning,
  #  fee_day: space.fee_day,
  #  fee_night: space.fee_night,
  #  image: space.image,
  #  studio_id: space.studio_id
  # }
  # end
end
