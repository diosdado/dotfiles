# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Desktop/Projects/TensorFlow/testing"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "tensorflow"; then

    # Create a new window inline within session layout definition.
    new_window "tensorflow"
    split_v 10
    split_h 50

    select_pane 1
    run_cmd "conda deactivate"
    run_cmd "cd ~/Desktop/Projects/TensorFlow/testing"
    run_cmd "nvim ."

    select_pane 2
    run_cmd "conda deactivate"

    select_pane 3
    run_cmd "conda deactivate"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
