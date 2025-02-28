$certPath = "docker\ssl\certs\ca-cert.pem"
$certStore = "Cert:\LocalMachine\Root"

Write-Output "Importing CA Certificate..."
Import-Certificate -FilePath $certPath -CertStoreLocation $certStore
Write-Output "CA Certificate Imported Successfully!"
