property :locale_name, String, name_property: true

default_action :update

action :update do
  return if locale_name.to_s.empty?

  powershell_script "Update user locale to #{locale_name}" do
    code <<-EOH
      Set-Culture -CultureInfo "#{locale_name}"
    EOH
    action :run
  end
end
