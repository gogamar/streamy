class ContentFinder
  def self.find(content_id, content_type)
    case content_type
    when 'Movie'
      Movie.find_by(id: content_id)
    when 'Season'
      Season.find_by(id: content_id)
    end
  end
end
