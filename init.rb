require 'redmine'
Redmine::Plugin.register :automatic_reassign do
  name 'Automatic Reassign plugin'
  author 'Bilel Kedidi'
  description 'this plugin allow to automatic re-assign to the author after updating an issue'
  version '0.0.1'
end


Rails.application.config.to_prepare do
  Issue.send(:include, AutomaticReassign::Patches::IssuePatch)
end
