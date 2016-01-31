PROVINCES = YAML::load_file(File.expand_path('../../provinces.yml', __FILE__)).with_indifferent_access
STATES    = YAML::load_file(File.expand_path('../../states.yml', __FILE__)).with_indifferent_access
COUNTRIES = { 'United States of America' => STATES, 'Canada' => PROVINCES }
