require_dependency 'site_content_type'
require_dependency 'site_content_class_methods'

class SiteContent < ActiveRecord::Base
  extend SiteContentClassMethods

  self.primary_key = 'content_type'

  validates_presence_of :content

  def self.formats
    @formats ||= Enum.new(:plain, :markdown, :html, :css)
  end

  add_content_type :usage_tips, default_18n_key: 'system_messages.usage_tips.text_body_template'
  add_content_type :welcome_user, default_18n_key: 'system_messages.welcome_user.text_body_template'
  add_content_type :welcome_invite, default_18n_key: 'system_messages.welcome_invite.text_body_template'
  add_content_type :education_new_topic, default_18n_key: 'education.new-topic'
  add_content_type :education_new_reply, default_18n_key: 'education.new-reply'
  add_content_type :tos_user_content_license, default_18n_key: 'terms_of_service.user_content_license'
  add_content_type :tos_miscellaneous, default_18n_key: 'terms_of_service.miscellaneous'

  def site_content_type
    @site_content_type ||= SiteContent.content_types.find {|t| t.content_type == content_type.to_sym}
  end

end
