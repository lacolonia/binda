module Binda
  module FieldSettingsHelper

  	def get_form_field_setting_url
  		return structure_field_group_field_settings_path if action_name == 'new'
  		return structure_field_group_field_setting_path  if action_name == 'edit'
  	end

  end
end