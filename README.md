# My Neovim Config

## layout

All modules are stored within the lua directory, there is no direct configuration to be done inside init.lua.
Each module should contain the configuration for a specific part of the system conecptually. The currnet modules are:

- Functions
- Globals
- Gui
- Keymappings
- Plugins
- Preview
- Settings

## modules
A breif definition of each module

### Functions
This contains any functions that should be used in other areas of the system, for example in keymappings. It also contains any utility functions
for feature flags aand the like.

### Globals
I have a selection of variables defined globally to that they can be shared between various configurations in modules, for example,
the theme will need to be defined in both the settings file and the status bar config. This allows for consistncy with a single change.

### Gui
Any settings that are only required when a gui is running (font)

### Keymappings
Non plugin specific keymappings, core functionality only

### Plugins
In here I have the lazy.nvim plugin specification and in the subfiles, any plugin specific configuration that needs doing

### Preview
Configuration to allow for live previewing of files, currently just markdown

## Settings
General settings, tab width, theme, backup dirs etc.
