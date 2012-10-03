class zoneminder::params {
  $prerequisites = ['apache2', 'mysql-server', 'php5', 'php5-mysql', 'build-essential', 'libmysqlclient-dev', 'libpostproc-dev', 'libssl-dev', 'libbz2-dev', 'libpcre3-dev', 'libdbi-perl', 'libarchive-zip-perl', 'libdate-manip-perl', 'libdevice-serialport-perl', 'libmime-perl', 'libpcre3', 'libwww-perl', 'libdbd-mysql-perl', 'libsys-mmap-perl', 'yasm']

  $zoneminder_source = 'https://github.com/mastertheknife/ZoneMinder-kfir.git'
  $zoneminder_configure_options = '--prefix=/opt/zm --with-libarch=lib64 --with-mysql=/usr --with-ffmpeg=/usr --with-webuser=www-data --with-webgroup=www-data --disable-debug --disable-crashtrace --enable-mmap=yes --with-webdir=/var/www/zm --with-cgidir=/usr/lib/cgi-bin ZM_SSL_LIB=openssl'

  $ffmpeg_source = 'git://source.ffmpeg.org/ffmpeg.git'
  $ffmpeg_configure_options = '--enable-shared --enable-swscale --enable-gpl'

  $libjpeg_source = 'http://downloads.sourceforge.net/project/libjpeg-turbo/1.1.1/libjpeg-turbo_1.1.1_amd64.deb?use_mirror=voxel'
}
