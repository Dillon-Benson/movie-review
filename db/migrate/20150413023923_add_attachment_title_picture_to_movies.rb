class AddAttachmentTitlePictureToMovies < ActiveRecord::Migration
  def self.up
    change_table :movies do |t|
      t.attachment :title_picture
    end
  end

  def self.down
    remove_attachment :movies, :title_picture
  end
end
