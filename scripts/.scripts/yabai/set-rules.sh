#!/bin/bash


while getopts "a" flag; do
    case $flag in
        a) apply=1;;
    esac
done

config_file=~/.scripts/.conf
. $config_file

/opt/homebrew/bin/yabai -m rule --remove  librewolf
/opt/homebrew/bin/yabai -m rule --remove  bravebrowser
/opt/homebrew/bin/yabai -m rule --remove  kitty
/opt/homebrew/bin/yabai -m rule --remove  inkscape
/opt/homebrew/bin/yabai -m rule --remove  gimp
/opt/homebrew/bin/yabai -m rule --remove  freeform
/opt/homebrew/bin/yabai -m rule --remove  pages
/opt/homebrew/bin/yabai -m rule --remove  numbers
/opt/homebrew/bin/yabai -m rule --remove  keynote
/opt/homebrew/bin/yabai -m rule --remove  onlyoffice


case $conference_layout in
    primary)
        /opt/homebrew/bin/yabai -m rule --add app="^Jitsi\ Meet$"     space=s_primary       label=jitsi
        ;;
    default)
        /opt/homebrew/bin/yabai -m rule --add app="^Jitsi\ Meet$"     space=s_conference    label=jitsi
        ;;
esac




case $yabai_layout in
    default)
        /opt/homebrew/bin/yabai -m rule --add app="LibreWolf"         space=s_primary       label=librewolf
        /opt/homebrew/bin/yabai -m rule --add app="Brave\ Browser"    space=s_primary       label=bravebrowser
        /opt/homebrew/bin/yabai -m rule --add app="kitty"             space=s_primary       label=kitty
        /opt/homebrew/bin/yabai -m rule --add app="Inkscape"          space=s_third         label=inkscape
        /opt/homebrew/bin/yabai -m rule --add app="GIMP"              space=s_third         label=gimp
        /opt/homebrew/bin/yabai -m rule --add app="Freeform"          space=s_third         label=freeform
        /opt/homebrew/bin/yabai -m rule --add app="Krita"             space=s_third         label=krita
        /opt/homebrew/bin/yabai -m rule --add app="Scribus"           space=s_third         label=scribus
        /opt/homebrew/bin/yabai -m rule --add app="Pages"             space=s_secondary     label=pages
        /opt/homebrew/bin/yabai -m rule --add app="Numbers"           space=s_secondary     label=numbers
        /opt/homebrew/bin/yabai -m rule --add app="Keynote"           space=s_secondary     label=keynote
        /opt/homebrew/bin/yabai -m rule --add app="ONLYOFFICE"        space=s_secondary     label=onlyoffice
        ;;
    design)
        /opt/homebrew/bin/yabai -m rule --add app="LibreWolf"         space=s_third         label=librewolf
        /opt/homebrew/bin/yabai -m rule --add app="Brave\ Browser"    space=s_third         label=bravebrowser
        /opt/homebrew/bin/yabai -m rule --add app="kitty"             space=s_third         label=kitty
        /opt/homebrew/bin/yabai -m rule --add app="Inkscape"          space=s_primary       label=inkscape
        /opt/homebrew/bin/yabai -m rule --add app="GIMP"              space=s_primary       label=gimp
        /opt/homebrew/bin/yabai -m rule --add app="Freeform"          space=s_primary       label=freeform
        /opt/homebrew/bin/yabai -m rule --add app="Krita"             space=s_primary       label=krita
        /opt/homebrew/bin/yabai -m rule --add app="Scribus"           space=s_primary       label=scribus
        /opt/homebrew/bin/yabai -m rule --add app="Pages"             space=s_secondary     label=pages
        /opt/homebrew/bin/yabai -m rule --add app="Numbers"           space=s_secondary     label=numbers
        /opt/homebrew/bin/yabai -m rule --add app="Keynote"           space=s_secondary     label=keynote
        /opt/homebrew/bin/yabai -m rule --add app="ONLYOFFICE"        space=s_secondary     label=onlyoffice
        ;;
    office)
        /opt/homebrew/bin/yabai -m rule --add app="LibreWolf"         space=s_third         label=librewolf
        /opt/homebrew/bin/yabai -m rule --add app="Brave\ Browser"    space=s_primary       label=bravebrowser
        /opt/homebrew/bin/yabai -m rule --add app="kitty"             space=s_third         label=kitty
        /opt/homebrew/bin/yabai -m rule --add app="Inkscape"          space=s_secondary     label=inkscape
        /opt/homebrew/bin/yabai -m rule --add app="GIMP"              space=s_secondary     label=gimp
        /opt/homebrew/bin/yabai -m rule --add app="Freeform"          space=s_secondary     label=freeform
        /opt/homebrew/bin/yabai -m rule --add app="Krita"             space=s_secondary     label=krita
        /opt/homebrew/bin/yabai -m rule --add app="Scribus"           space=s_secondary     label=scribus
        /opt/homebrew/bin/yabai -m rule --add app="Pages"             space=s_primary       label=pages
        /opt/homebrew/bin/yabai -m rule --add app="Numbers"           space=s_primary       label=numbers
        /opt/homebrew/bin/yabai -m rule --add app="Keynote"           space=s_primary       label=keynote
        /opt/homebrew/bin/yabai -m rule --add app="ONLYOFFICE"        space=s_primary       label=onlyoffice
        ;;
esac



case "$apply" in
    1)
        /opt/homebrew/bin/yabai -m rule --apply  jitsi

        /opt/homebrew/bin/yabai -m rule --apply  librewolf
        /opt/homebrew/bin/yabai -m rule --apply  bravebrowser
        /opt/homebrew/bin/yabai -m rule --apply  kitty
        /opt/homebrew/bin/yabai -m rule --apply  inkscape
        /opt/homebrew/bin/yabai -m rule --apply  gimp
        /opt/homebrew/bin/yabai -m rule --apply  freeform
        /opt/homebrew/bin/yabai -m rule --apply  krita
        /opt/homebrew/bin/yabai -m rule --apply  scribus
        /opt/homebrew/bin/yabai -m rule --apply  pages
        /opt/homebrew/bin/yabai -m rule --apply  numbers
        /opt/homebrew/bin/yabai -m rule --apply  keynote
        /opt/homebrew/bin/yabai -m rule --apply  onlyoffice
    ;;
esac



