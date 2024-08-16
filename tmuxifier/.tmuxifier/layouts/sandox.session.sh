# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Desktop/Projects/SandoxSite2024/site"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "sandox"; then

    new_window "sdx-nvim"
    new_window "sdx-term"

    # Terminal
    # -------------------------------------------------------
    select_window "sdx-term"
    run_cmd "cd ~/Desktop/Projects/SandoxSite2024/site"
    run_cmd "clear"

    # Entorno Neovim
    # -------------------------------------------------------
    select_window "sdx-nvim"
    split_v 10

    # Sass
    select_pane 2
    run_cmd "cd ~/Desktop/Projects/SandoxSite2024/site"
    run_cmd "clear"
    run_cmd "sass --watch sass:css"

    # Neovim
    select_pane 1
    run_cmd "cd ~/Desktop/Projects/SandoxSite2024/site"
    run_cmd "clear"
    run_cmd "nvim ."

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
