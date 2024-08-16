# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/seatsa"

session_root "~/Desktop/Projects/Seatsa"
# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "seatsa"; then

    new_window "seatsa-nvim"
    new_window "seatsa-term"

    # Terminal
    # -------------------------------------------------------
    select_window "seatsa-term"

    # Entorno Neovim
    # -------------------------------------------------------
    select_window "seatsa-nvim"
    split_v 30

    # Sass
    select_pane 2

    # Neovim
    select_pane 1
    run_cmd "nvim ."
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
