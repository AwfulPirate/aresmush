module AresMUSH
  module Rooms
    module Api
      def self.move_to(client, char, room, exit_name = nil?)
        Rooms.move_to(client, char, room, exit_name)
      end
    
      def self.is_special_room?(room)
        Game.master.is_special_room?(room)
      end
      
      def self.send_to_welcome_room(client, char)
        Rooms.move_to(client, char, Game.master.welcome_room)
      end
      
      def self.ic_start_room
        Game.master.ic_start_room
      end
      
      def self.ooc_room
        Game.master.ooc_room
      end
      
      def self.area(room)
        room.room_area
      end
    
      def self.grid_x(room)
        room.room_grid_x
      end
    
      def self.grid_y(room)
        room.room_grid_y
      end
    
      def self.is_foyer?(room)
        room.room_is_foyer
      end
      
      def self.room_type(room)
        room.room_type
      end
      
      def self.can_use_exit?(ex, char)
        Rooms.can_use_exit?(ex, char)
      end
    end
  end
end