module Core
  class Engine < ::Rails::Engine
    isolate_namespace Core

    # HOWTO  This is a way to make your migrations available in your
    # rails engine.  This has to be done in any engine defining new
    # models.  This is from:
    #
    # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines
    #
    initializer :append_migrations do |app|
      unless app.root.to_s.match(root.to_s)
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
