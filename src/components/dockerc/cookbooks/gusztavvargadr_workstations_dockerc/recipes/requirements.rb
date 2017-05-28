powershell_script 'Set service \'WinRM\' to \'Autostart (Delayed)\'' do
  code 'sc.exe config winrm start= delayed-auto'
  action :run
end
