# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Desktop/Projects/sdx-tasks/site"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "sdx-tasks"; then

    new_window "sdx-tasks-nvim"
    new_window "sdx-tasks-term"

    # Terminal
    # -------------------------------------------------------
    select_window "sdx-tasks-term"
    run_cmd "clear"

    # Entorno Neovim
    # -------------------------------------------------------
    select_window "sdx-tasks-nvim"
    split_v 5

    # Neovim
    select_pane 1
    run_cmd "clear"
    run_cmd "nvim ."

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session

