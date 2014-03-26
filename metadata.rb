name             'bitlbee-latest'
maintainer       'Matt Chun-Lum'
maintainer_email 'mchunlum@gmail.com'
license          'All rights reserved'
description      'Installs/Configures bitlbee-latest'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'

%w{ ubuntu }.each do |os|
  supports os
end
