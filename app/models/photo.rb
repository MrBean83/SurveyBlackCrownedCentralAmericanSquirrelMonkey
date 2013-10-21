class Photo < ActiveRecord::Base
  mount_uploader :filename, Uploader
  belongs_to :survey

  def minify
    self.filename.to_s.match(/(.*\/)([^\/]*$)/)
    filename = $2.to_s
    preface = $1.to_s
    "#{preface}icon_#{filename}"
  end
end
