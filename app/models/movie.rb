class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  has_attached_file :title_picture, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :title_picture, :content_type => /\Aimage\/.*\Z/

  validate :one_review_per_user

  ratyrate_rateable "user_rating"

  searchkick

  def one_review_per_user
    user_ids = []
    self.reviews.each { |review| user_ids << review.user_id }
    errors.add(:review, "a movie can only have one review per user.") unless user_ids.length == user_ids.uniq.length
  end
end
