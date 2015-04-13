class AddAttachmentPictureTitleToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :picture_title
    end
  end

  def self.down
    remove_attachment :movies, :picture_title
  end
end
