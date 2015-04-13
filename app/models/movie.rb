class Movie < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  has_attached_file :title_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :title_picture, :content_type => /\Aimage\/.*\Z/
end
