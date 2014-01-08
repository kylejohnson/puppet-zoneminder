class zoneminder::params {
  $zoneminder_db_user = 'zm'
  $zoneminder_db_pass = 'zm'
  
  $prerequisites = ['apache2', 'mysql-server', 'php5', 'php5-mysql', 'build-essential', 'libmysqlclient-dev', 'libssl-dev', 'libbz2-dev', 'libpcre3-dev', 'libdbi-perl', 'libarchive-zip-perl', 'libdate-manip-perl', 'libdevice-serialport-perl', 'libmime-perl', 'libpcre3', 'libwww-perl', 'libdbd-mysql-perl', 'libsys-mmap-perl', 'yasm', 'subversion', 'automake', 'autoconf', 'libjpeg-turbo8-dev', 'libjpeg-turbo8', 'apache2-mpm-prefork', 'libapache2-mod-php5', 'php5-cli', 'libtheora-dev', 'libvorbis-dev', 'libvpx-dev', 'libx264-dev', 'libmp4v2-dev']

  $zoneminder_source = 'https://github.com/ZoneMinder/ZoneMinder.git'
  $zoneminder_branch = 'master'

  $ffmpeg_source = 'git://source.ffmpeg.org/ffmpeg.git'
  $ffmpeg_configure_options = '--enable-shared --enable-swscale --enable-gpl  --enable-libx264 --enable-libvpx --enable-libvorbis --enable-libtheora'


  $libjpeg_source = 'http://downloads.sourceforge.net/project/libjpeg-turbo/1.1.1/libjpeg-turbo_1.1.1_amd64.deb?use_mirror=voxel'
}
