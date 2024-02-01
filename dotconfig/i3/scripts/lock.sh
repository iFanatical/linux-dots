#!/bin/sh

BLANK='#1c1f2488'
CLEAR='#ffffff88'
DEFAULT='#51afef88'
TEXT='#eeeeeebb'
WRONG='#c678dd88'
VERIFYING='#4db5bd88'
IMAGE='/usr/share/backgrounds/archcraft-backgrounds/files/spark.jpg'
TYPING='c678ddff'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
--image=$IMAGE --scale       \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$VERIFYING     \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$TYPING        \
--bshl-color=$WRONG          \
\
--notify					 \
--ring-width 6.0             \
--radius 120                 \
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
--keylayout 1                \
