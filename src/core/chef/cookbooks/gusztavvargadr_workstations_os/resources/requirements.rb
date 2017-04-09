property :requirements_systemlocale, String
property :requirements_uilocale, String
property :requirements_userlocale, String
property :requirements_timezone, String

default_action :install

action :install do
  unless requirements_systemlocale.nil?
    gusztavvargadr_workstations_os_systemlocale requirements_systemlocale do
      action :set
    end
  end

  unless requirements_uilocale.nil?
    gusztavvargadr_workstations_os_uilocale requirements_uilocale do
      action :set
    end
  end

  unless requirements_userlocale.nil?
    gusztavvargadr_workstations_os_userlocale requirements_userlocale do
      action :set
    end
  end

  unless requirements_timezone.nil?
    gusztavvargadr_workstations_os_timezone requirements_timezone do
      action :set
    end
  end
end
