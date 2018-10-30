module OMJRAEDMM
  class << self
    CONFIG_FILE = "config/omjraedmm.yml".freeze
    ENV_VAR_REGEX = /\${([^}]+)}/

    def config(key, *subkeys)
      value = subkeys.any? ? yaml_config.dig(key, *subkeys) : yaml_config[key]

      load_if_env(value)
    end

    private

    def yaml_config
      @yaml_config ||=
        YAML.
          load_file(CONFIG_FILE).
          deep_symbolize_keys
    end

    def load_if_env(var)
      match = ENV_VAR_REGEX.match(var)
      return var unless match

      var_name = match.captures.first
      ENV[var_name]
    end
  end
end
