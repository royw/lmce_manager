# Copyright 2008 by Roy Wright
# License: GPL version 2 (http://www.opensource.org/licenses/gpl-2.0.php)

require 'active_record'

$config = YAML.load_file(File.join(File.dirname(__FILE__), '../../config/database.yml'))

class PlutoMainDatabase < PlutoDatabase
  self.abstract_class = true
  establish_connection $config['pluto_main_database']
  # add your model extensions after this line
end






























































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































