property :requirements_features_options, Hash

default_action :enable

action :enable do
  return if new_resource.requirements_features_options.nil?

  new_resource.requirements_features_options.each do |feature_name, feature_options|
    powershell_script "Enable Windows Feature '#{feature_name}'" do
      code <<-EOH
        DISM.exe /Online /Enable-Feature /FeatureName:#{feature_name} /All /NoRestart
      EOH
      returns [0, 3010]
      action :run
    end
  end
end
