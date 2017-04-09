property :requirements_options, Hash

default_action :install

action :install do
  requirements_systemlocale = requirements_options['systemlocale']
  unless requirements_systemlocale.nil?
    gusztavvargadr_workstations_os_systemlocale requirements_systemlocale do
      action :set
    end
  end

  requirements_uilocale = requirements_options['uilocale']
  unless requirements_uilocale.nil?
    gusztavvargadr_workstations_os_uilocale requirements_uilocale do
      action :set
    end
  end

  requirements_userlocale = requirements_options['userlocale']
  unless requirements_userlocale.nil?
    gusztavvargadr_workstations_os_userlocale requirements_userlocale do
      action :set
    end
  end

  requirements_timezone = requirements_options['timezone']
  unless requirements_timezone.nil?
    gusztavvargadr_workstations_os_timezone requirements_timezone do
      action :set
    end
  end

  requirements_variables = requirements_options['variables']
  unless requirements_variables.nil?
    requirements_variables.each do |requirements_variable_name, requirements_variable_value|
      gusztavvargadr_workstations_os_variable requirements_variable_name do
        variable_value requirements_variable_value
        action :set
      end
    end
  end
end
