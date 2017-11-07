# Digital Signature Hijack
Hijacking legitimate digital signatures is a technique that can be used during red team assessments in order to sign PowerShell code and binaries. This could assist to bypass Device Guard restrictions and maintain stealthy in an engagement. DigitalSignatureHijack is a PowerShell script based on [Matt Graeber](https://github.com/mattifestation/) research that can perform the following operations:

* Digitally sign all portable executables on the host as Microsoft
* Digitally sign all powershell scripts on the host as Microsoft
* Validate the digital signature for all portable executables
* Validate the digital signature for all powershell scripts

This is achieved by hijacking the registry and adding the necessary values and by utilizing the custom SIP dll file that Matt Graeber developed. Users need to modify the path of MySIP.dll to their local path.

* MySIP.dll - https://github.com/mattifestation/PoCSubjectInterfacePackage

# Demo
TODO
https://pentestlab.files.wordpress.com/2017/11/powershell-script-valid-signature-e1510082619334.png

# Resources
* [Hijacking Digital Signatures](https://pentestlab.blog/2017/11/06/hijacking-digital-signatures/)
* [Application of authenticode signatures](http://www.exploit-monday.com/2017/08/application-of-authenticode-signatures.html)
* [Subverting Trust in Windows](https://specterops.io/assets/resources/SpecterOps_Subverting_Trust_in_Windows.pdf)
* [Subverting and Restoring Trust in Windows](https://www.youtube.com/watch?v=wxmxxgL6Nz8)
* [Borrowing Microsoft Code Signing Certificates](https://blog.conscioushacker.io/index.php/2017/09/27/borrowing-microsoft-code-signing-certificates/)

# Disclaimer
* The purpose of this repository is to store compiled DLL's, binaries, scripts and to centralize existing information about digital signature hijacking. All the credits are going to the original authors of these tools. 
* The binaries and the DLL which are stored in this repository have not been modified from their original state and they are totally safe. However if for any reason you don't trust this repository the original repositories which contain the source code of these tools are provided in order to compile them by yourself.

# Credits

* [Matt Graeber](twitter.com/mattifestation)
* Chris Ross
* [netbiosX](https://twitter.com/netbiosX)
