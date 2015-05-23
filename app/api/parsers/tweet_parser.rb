class TweetParser

  def self.parser(values = nil)
    return if values.nil?
    obj          ||= Tweet.new
    obj.id_str     = values[:id_str]     if values[:id_str].present?
    obj.text       = values[:text]       if values[:text].present?
    obj.created_at = values[:created_at] if values[:created_at].present?
    obj
  end

end
