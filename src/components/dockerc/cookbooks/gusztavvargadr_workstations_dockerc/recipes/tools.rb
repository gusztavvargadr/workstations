powershell_script 'Set service \'WinRM\' to \'Autostart\'' do
  code 'sc.exe config winrm start= auto'
  action :run
end
