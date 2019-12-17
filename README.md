## sckyzo/privatebin

Paste securely.

#### Features
- Based on Alpine Linux (sckyzo/nginx-php image)
- Uses [PrivateBin](https://github.com/PrivateBin/PrivateBin), originally a fork of zerobin by elrido.
- Bundled with nginx and PHP 7.3

#### Build-time variables
- **PRIVATEBIN_VER** : version of PrivateBin

#### Environment variables
- **UID** : privatebin user id
- **GID** : privatebin group id
- **MEMORY_LIMIT** : php memory limit *(default : 128M)*
- **UPLOAD_MAX_SIZE** : maximum upload size *(default : 10M)*

#### Volumes
- **/privatebin/data**

#### Ports
- **8888** [(reverse proxy!)](https://github.com/hardware/mailserver/wiki/Reverse-proxy-configuration)
