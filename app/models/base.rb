class Base
  class << self
    include CoreRequest
  end
  class << self
    attr_accessor :hmn
    attr_accessor :han
    attr_accessor :hav
    attr_accessor :lg
    attr_accessor :mn
  end

  def self.routes
    {}
  end

  def self.method_missing(name, *args)
    url, method = routes[name]
    return super unless url
    if args.length > 2
      url = url % args[2]
    end
    return make_request(url, method, *args[0..1])
  end

  def self.model_name
    self.mn ||= {}
    self.mn[I18n.locale] ||= self.to_s.gsub(/(.)([A-Z])/,'\1_\2').downcase
  end

  def self.human_model_name
    self.hmn ||= {}
    self.hmn[I18n.locale] ||= I18n.t("activerecord.models.#{self.model_name}")
  end

  def self.human_attribute_name(attribute)
    self.han ||= {}
    self.han[I18n.locale] ||= {}
    self.han[I18n.locale][attribute.to_sym] ||=
      I18n.t("activerecord.attributes.#{self.model_name}.#{attribute}")
  end

  def self.human_attribute_value(attribute, value)
    self.hav ||= {}
    self.hav[I18n.locale] ||= {}
    self.hav[I18n.locale][attribute.to_sym] ||= {}
    self.hav[I18n.locale][attribute.to_sym][value.to_sym] ||=
      I18n.t("activerecord.values.#{self.model_name}.#{attribute}.#{value}")
 end

  def self.locale_gender
    self.lg ||= {}
    self.lg[I18n.locale] ||= I18n.t("activerecord.genders.#{self.model_name}",default: nil)
  end
end
