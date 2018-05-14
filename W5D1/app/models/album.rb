# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, presence: true
  validates :year, presence: true
  validates :live, inclusion: {in: [true,false]}

    belongs_to(
      :band,
      primary_key: :id,
      foreign_key: :band_id,
      class_name: :Band
    )
end
