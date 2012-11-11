module AresMUSH
  module Login
    class Create
      def commands
        ["create (?<name>\\S+) (?<password>\\S+)"]
      end

      def on_player_command(client, cmd)
        name = cmd[:name]
        password = cmd[:password]

        existing_player = Players.find(name)
        if (!existing_player.nil?)
          client.emit_failure(t('login.player_name_taken'))
        else
          # TODO: Encrypt password
          # TODO: Specs
          Players.create(name, password)
          client.emit_success(t('login.player_created', :name => name))
        end
      end
      
      include AresMUSH::Addon
      
    end
  end
end