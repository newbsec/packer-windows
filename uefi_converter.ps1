# Path to the Extracted or Mounted Windows ISO 
$ISOMediaFolder = 'E:\'

# Path to new re-mastered ISO
$ISOFile = 'D:\Software\ISO\Win10-64_noprompt.iso'

# Need to specify the root directory of the oscdimg.exe utility which you need to download
$PathToOscdimg = 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\x86\Oscdimg'


# Instead of pointing to normal efisys.bin, use the *_noprompt instead
$BootData='2#p0,e,b"{0}"#pEF,e,b"{1}"' -f "$ISOMediaFolder\boot\etfsboot.com","$ISOMediaFolder\efi\Microsoft\boot\efisys_noprompt.bin"

# re-master Windows ISO
Start-Process -FilePath "$PathToOscdimg\oscdimg.exe" -ArgumentList @("-bootdata:$BootData",'-u2','-udfver102',"$ISOMediaFolder","$ISOFile") -PassThru -Wait -NoNewWindow