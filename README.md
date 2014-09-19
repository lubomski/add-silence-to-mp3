add-silence-to-mp3
==================

This is a bash script which leverages SoX to add 1 second of silence to an existing .mp3 file

converts all .mp3 files in the subfolders of where this script is executed to contain 1 second of silence at the start and end of the file

all converted files will be in the new subdirectory "converted" inside the directory where this script is executed; the original files will not be touched

you have to install sox prior to running this script http://sox.sourceforge.net/
