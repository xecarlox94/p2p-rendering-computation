<!-- Code generated by gomarkdoc. DO NOT EDIT -->

# generate

```go
import "github.com/Akilan1999/p2p-rendering-computation/config/generate"
```

## Index

- [func Copy\(src, dst string\) error](<#Copy>)
- [func CreateIPTableFolderStructure\(\) \(err error\)](<#CreateIPTableFolderStructure>)
- [func FileExists\(path string\) \(bool, error\)](<#FileExists>)
- [func GenerateCertificate\(\) error](<#GenerateCertificate>)
- [func GenerateClientTrackContainers\(\) \(err error\)](<#GenerateClientTrackContainers>)
- [func GenerateDockerFiles\(\) \(err error\)](<#GenerateDockerFiles>)
- [func GenerateFiles\(rootNodes ...p2p.IpAddress\) \(err error\)](<#GenerateFiles>)
- [func GenerateIPTableFile\(rootNodes \[\]p2p.IpAddress\) \(err error\)](<#GenerateIPTableFile>)
- [func GeneratePluginDirectory\(\) \(err error\)](<#GeneratePluginDirectory>)
- [func GetPathP2PRC\(\) \(string, error\)](<#GetPathP2PRC>)
- [func MakeSSHKeyPair\(pubKeyPath, privateKeyPath string\) error](<#MakeSSHKeyPair>)
- [func SetDefaults\(envName string, forceDefault bool, CustomConfig interface\{\}, NoBoilerPlate bool, ConfigUpdate ...\*config.Config\) \(\*config.Config, error\)](<#SetDefaults>)
- [func SetEnvName\(EnvName string\) error](<#SetEnvName>)
- [func String\(length int\) string](<#String>)
- [func StringWithCharset\(length int, charset string\) string](<#StringWithCharset>)
- [type AuthorizedKey](<#AuthorizedKey>)


<a name="Copy"></a>
## func [Copy](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/helperFunctions.go#L21>)

```go
func Copy(src, dst string) error
```

Copy the src file to dst. Any existing file will be overwritten and will not copy file attributes. Source: https://stackoverflow.com/questions/21060945/simple-way-to-copy-a-file

<a name="CreateIPTableFolderStructure"></a>
## func [CreateIPTableFolderStructure](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L65>)

```go
func CreateIPTableFolderStructure() (err error)
```

CreateIPTableFolderStructure Create folder structure for IPTable

<a name="FileExists"></a>
## func [FileExists](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L218>)

```go
func FileExists(path string) (bool, error)
```

FileExists exists returns whether the given file or directory exists source: https://stackoverflow.com/questions/10510691/how-to-check-whether-a-file-or-directory-exists

<a name="GenerateCertificate"></a>
## func [GenerateCertificate](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateCertificate.go#L51>)

```go
func GenerateCertificate() error
```



<a name="GenerateClientTrackContainers"></a>
## func [GenerateClientTrackContainers](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L154>)

```go
func GenerateClientTrackContainers() (err error)
```



<a name="GenerateDockerFiles"></a>
## func [GenerateDockerFiles](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L91>)

```go
func GenerateDockerFiles() (err error)
```

GenerateDockerFiles Generate default docker files

<a name="GenerateFiles"></a>
## func [GenerateFiles](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L17>)

```go
func GenerateFiles(rootNodes ...p2p.IpAddress) (err error)
```

GenerateFiles Generates all the files needed to setup P2PRC

<a name="GenerateIPTableFile"></a>
## func [GenerateIPTableFile](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L35>)

```go
func GenerateIPTableFile(rootNodes []p2p.IpAddress) (err error)
```

GenerateIPTableFile Generates the IPTable file with the appropirate root node

<a name="GeneratePluginDirectory"></a>
## func [GeneratePluginDirectory](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L136>)

```go
func GeneratePluginDirectory() (err error)
```

GeneratePluginDirectory Generates plugin directory structure

<a name="GetPathP2PRC"></a>
## func [GetPathP2PRC](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generate.go#L17>)

```go
func GetPathP2PRC() (string, error)
```

GetPathP2PRC Getting P2PRC Directory from environment variable

<a name="MakeSSHKeyPair"></a>
## func [MakeSSHKeyPair](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L186>)

```go
func MakeSSHKeyPair(pubKeyPath, privateKeyPath string) error
```

MakeSSHKeyPair make a pair of public and private keys for SSH access. Public key is encoded in the format for inclusion in an OpenSSH authorized\_keys file. Private Key generated is PEM encoded source: https://gist.github.com/goliatone/e9c13e5f046e34cef6e150d06f20a34c

<a name="SetDefaults"></a>
## func [SetDefaults](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generate.go#L36>)

```go
func SetDefaults(envName string, forceDefault bool, CustomConfig interface{}, NoBoilerPlate bool, ConfigUpdate ...*config.Config) (*config.Config, error)
```

SetDefaults This function to be called only during a make install

<a name="SetEnvName"></a>
## func [SetEnvName](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generate.go#L26>)

```go
func SetEnvName(EnvName string) error
```

SetEnvName Sets the environment name This is to ensure that the Path of your project is detected from your environment variable This is useful when extending the use case of P2PRC

<a name="String"></a>
## func [String](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generate.go#L176>)

```go
func String(length int) string
```



<a name="StringWithCharset"></a>
## func [StringWithCharset](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generate.go#L168>)

```go
func StringWithCharset(length int, charset string) string
```



<a name="AuthorizedKey"></a>
## type [AuthorizedKey](<https://github.com/Akilan1999/p2p-rendering-computation/blob/master/config/generate/generateFiles.go#L230-L233>)

AuthorizedKey struct represents the structure of an authorized key

```go
type AuthorizedKey struct {
    Username string
    Key      string
}
```

Generated by [gomarkdoc](<https://github.com/princjef/gomarkdoc>)
