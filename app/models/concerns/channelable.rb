module Channelable
  extend ActiveSupport::Concern

  included do
    def self.category
      to_s.underscore.split('_').first.pluralize
    end
  end

  def kls
     Rails.logger.debug "CLASS CATEGORY: #{self.class.category}"
    "#{self.class.category}/#{key}".camelize.constantize
  end

end 