class zoneminder::params {
  $zoneminder_db_user = 'zm'
  $zoneminder_db_pass = 'zm'
  

  $prerequisites = ['apache2', 'mysql-server', 'php5', 'php5-mysql', 'build-essential', 'libmysqlclient-dev', 'libssl-dev', 'libbz2-dev', 'libpcre3-dev', 'libdbi-perl', 'libarchive-zip-perl', 'libdate-manip-perl', 'libdevice-serialport-perl', 'libmime-perl', 'libpcre3', 'libwww-perl', 'libdbd-mysql-perl', 'libsys-mmap-perl', 'yasm', 'subversion', 'automake', 'autoconf', 'libjpeg-turbo8-dev', 'libjpeg-turbo8', 'apache2-mpm-prefork', 'libapache2-mod-php5', 'php5-cli']

  $zoneminder_source = 'https://svn.unixmedia.net/public/zum/trunk/zum/'

  $ffmpeg_source = 'git://source.ffmpeg.org/ffmpeg.git'
  $ffmpeg_configure_options = '--enable-shared --enable-swscale --enable-gpl'

  $libjpeg_source = 'http://downloads.sourceforge.net/project/libjpeg-turbo/1.2.1/libjpeg-turbo_1.2.1_amd64.deb?use_mirror=voxel'
}
