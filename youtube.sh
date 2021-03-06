#!/bin/sh

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.


#To use this script you need mpv and youtube-dl to be installed

if [ "$1" == "help" ]
	then
	echo "Usage: ./youtube.sh [VIDEO LINK] [QUALITY OPTION]"
	echo " "
	echo "To play a video, type your link and the quality option you want to use."
	echo " "
	echo "Available quality options:"
 	echo "full-quality - Plays the video in the best quality available"
	echo "720 - Plays the video in 720p"
	echo "480 - Plays the video in 480p"
	echo "360 - Plays the video in 360p"
	echo "no-video - Plays only the audio"
	echo " "
	echo "To display this screen, type \"./youtube.sh help\""	
else
	case "$2" in
		"full-quality") echo " "
		echo "Loading video at full quality..."
		echo " "
		mpv "$1"
		;;

		"720") echo " "
		echo "Loading video at 720p..."
		echo " "
		mpv "$1" --ytdl-format="bestvideo[height<=?1080]+bestaudio/best"
		;;

		"480") echo " "
		echo "Loading video at 480p..."
		echo " "
		mpv "$1" --ytdl-format="bestvideo[height<=?720]+bestaudio/best"
		;;
	
		"360") echo " "
		echo "Loading video at 360p..."
		echo " "
		mpv "$1" --ytdl-format="bestvideo[height<=?480]+bestaudio/best"
		;;
	
		"no-video") echo " "
		echo "Loading audio..."
		echo " "
		mpv "$1" --no-video
		;;

		*) echo " "
		echo "Error! Not an available option."
	esac
fi
