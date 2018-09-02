# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules', 'fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w( bootstrap.min.css demo.css light-bootstrap-dashboard.css core/bootstrap.min.js core/jquery.3.2.1.min.js core/popper.min.js plugins/bootstrap-datepicker.js plugins/bootstrap-notify.js plugins/bootstrap-switch.js plugins/chartist.min.js plugins/nouislider.min.js demo.js light-bootstrap-dashboard.js plugins/chartist.min.js apple-icon.png default-avatar.png favicon.ico full-screen-image-3.jpg loading-bubbles.svg mask.png new_logo.png sidebar-1.jpg sidebar-2.jpg sidebar-3.jpg sidebar-4.jpg sidebar-5.jpg tim_80x80.png)
Rails.application.config.assets.precompile += %w( nucleo-icons.eot nucleo-icons.svg nucleo-icons.ttf nucleo-icons.woff nucleo-icons.woff2)
