# frozen_string_literal: true

# name: user-auto-active
# about: Auto active users
# version: 0.0.1
# authors: Lhc_fl
# meta_topic_id: TODO
# url: TODO

enabled_site_setting :enable_user_auto_active_plugin

after_initialize do

  module UserAutoActiveExtension
    extend ActiveSupport::Concern
    prepended do
      before_save do
        self.active = true if SiteSetting.enable_user_auto_active_plugin
      end
    end
  end

  reloadable_patch do
    ::User.prepend UserAutoActiveExtension
  end
end
