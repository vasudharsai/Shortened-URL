class Url < ApplicationRecord
  before_create :generate_short_url
  before_create :sanitize

  validates :original_url, presence: true, uniqueness: true


 private
  def generate_short_url
    chars = [0..9, 'A'..'Z', 'a'..'z'].map { |range| range.to_a }.flatten
    self.shortened_url =  6.times.map { chars.sample }.join
  end

  def sanitize
    self.original_url.strip!
    self.original_url = original_url.downcase.gsub(/(https?:\/\/)|(www\.)/,"")
    self.original_url = "http://#{self.original_url}"
  end
end
