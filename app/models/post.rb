class Post < ActiveRecord::Base
  def self.draft
  end

  scope :published, -> {where(draft_status: false)}
  scope :draft, -> {where(draft_status: true)}


end
