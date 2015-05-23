class UserParser

  def self.parser(values = nil)
    return if values.nil?
    obj           ||= User.new
    obj.id_str      = values[:id_str]      if values[:id_str].present?
    obj.name        = values[:name]        if values[:name].present?
    obj.created_at  = values[:created_at]  if values[:created_at].present?
    obj.screen_name = values[:screen_name] if values[:screen_name].present?
    obj
  end

end
