#!/bin/sh
# Credit to a random person on the i3WM subreddit for this script https://www.reddit.com/r/i3wm/comments/3sumks/cant_get_scrolllock_and_mod_key_to_work/
STATUS=`xset -q | grep "LED" | awk '{print $10}'`
if [ "${STATUS}" = "00000008"  ]
then
		xset led 3
else
		xset -led 3
fi
exit 0
