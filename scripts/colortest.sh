#!/bin/bash

cat "$0" 1>&2;
#
# = Coloring test utility =
#
# [
# |*| Source: https://unix.stackexchange.com/a/643536
# |*| Source (original): https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
# |*| Last update: CE 2021-08-18 06:29 UTC ]
#
#
# [ Caveat:
#
# The description below has insufficient coverage on the subject. (and part of which may be outright misleading)
#
# Check # References for a complete view. ]
#
#
# This script shall echo a bunch of color codes: demonstrating the coloring compatibility of the shell / terminal.
#
# Each output line of interest would consist of:
# |*| The literal color code itself: of 1 foreground (font) color, out of the 17 (default + 16 escapes).
# |*| Followed by its testcase: with all of the 9 background colors (default + 8 escapes).
#
#
#
#
# == Implementation ==
#
# Testcase text:
    text='gYw';

    echo -e '\n         [m     [40m    [41m    [42m    [43m    [44m    [45m    [46m    [47m';

    for FGs in \
    '  [0;m' \
    '[1;37m' \
    '[0;30m' \
    '[1;30m' \
    '[0;31m' \
    '[1;31m' \
    '[0;32m' \
    '[1;32m' \
    '[0;33m' \
    '[1;33m' \
    '[0;34m' \
    '[1;34m' \
    '[0;35m' \
    '[1;35m' \
    '[0;36m' \
    '[1;36m' \
    '[0;37m';

    do {
    FG="${FGs//[[:space:]]/""}";
    echo -nE "$FGs ";
    echo -ne '\e'$FG;
    echo -nE "  $text  ";

    for BG in \
    '[40m' '[41m' '[42m' '[43m' '[44m' '[45m' '[46m' '[47m';

    do
    echo -nE ' ';
    echo -ne '\e'$FG'\e'$BG; # [Note 1]
    echo -nE "  $text  ";
    echo -ne '\e[m'; # [Note 2]

    done;

    echo;
    };

    done;

    unset text FGs FG BG;
    echo;
#
#
#
#
# == Notes & References ==
#
#
# === Notes ===
#
# [Note 1]
# [
# Note the order may not be inverted: setting the foreground color ("$FG") may reset the background color ("$BG").
#
# Check ANSI escape sequence # CSI [1], and [ https://misc.flogisoft.com/bash/tip_colors_and_formatting#attributes_combination ] [3] for details. ]
#
#
# [Note 2]
# [
# There are also some other formatting codes not included in the table but may be used to alter the text's appearance:
#
# |*| '\e[1m': Bold
# |*| '\e[2m': Dim
# |*| '\e[4m': Underlined
# |*| '\e[5m': Blink
# |*| '\e[7m': Inverse color
# |*| '\e[8m': Hidden
# |*| '\e[9m': Strikethrough ]
#
#
# === References ===
#
# [1]
# [
# |*| ANSI escape sequence ## CSI; SGR; Examples:
# [
# |*| https://en.wikipedia.org/wiki/ANSI_escape_code#CSI
# |*| https://en.wikipedia.org/wiki/ANSI_escape_code#SGR
# |*| https://en.wikipedia.org/wiki/ANSI_escape_code#Examples ] ]
#
#
# [2]
# [
# |*| Unix formatting code (Google Search): https://www.google.com/search?hl=en&gl=us&q=Unix+formatting%7Ccolor+code ]
#
#
# [3]
# [
# |*| Colors and formatting (ANSI/VT100 Control sequences): https://misc.flogisoft.com/bash/tip_colors_and_formatting ]
#
#
#
#
# == See also ==
#
# |*| 256-color test: https://unix.stackexchange.com/a/643715
#