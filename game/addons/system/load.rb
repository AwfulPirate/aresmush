module AresMUSH
  module System
    class Load      
      def on_registered
        @addon_manager = container.addon_manager
      end

      def commands
        ["load (?<addon_name>.+)"]
      end

      def on_player_command(client, cmd)
        addon_name = cmd[:addon_name]
        begin
          @addon_manager.load_addon(addon_name)
          client.emit_success "Reloading '#{addon_name}' addon."
        rescue SystemNotFoundException => e
          client.emit_failure "Can't find '#{addon_name}' addon."
        rescue Exception => e
          client.emit_failure "Error loading '#{addon_name}' addon: #{e.to_s}"
        end
      end
      
      include AresMUSH::Addon      
    end
  end
end
