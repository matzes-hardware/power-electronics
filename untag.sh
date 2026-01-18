#!/bin/bash
#
# Removes location information from JPEG image tags
#

# Check command line arguments
if [ $# -lt 1 ]; then
    echo "Usage: $0 <filename> [filename] [filename] ..." >&2;
    exit 1;
fi

if [ $# -gt 1 ]; then
    echo "Processing $# files..." >&2;
    for FILENAME in "$@"; do
        . "$0" "$FILENAME" >&2;
    done
    echo "Done processing $# files." >&2;
    exit 0;
fi

FILENAME="$1"
if [ ! -f "$FILENAME" ]; then
    echo "Error: File not found: $FILENAME" >&2;
    exit 2;
fi

# Check dependencies
if ! command -v identify >/dev/null 2>&1; then
    echo "Error: identify not found (Is ImageMagick installed?)" >&2;
    exit 11;
fi
if ! command -v exif >/dev/null 2>&1; then
    echo "Error: exif not found (Is exif installed?)" >&2;
    exit 13;
fi

# Check image integrity
identify "$FILENAME" | cut -d" " -f2- >&2
if [ $? != 0 ]; then
    echo "Error: Corrupted image data. Aborting." >&2;
    exit 31;
fi

# Show present image tags
# echo "EXIF tags:" >&2;
# exif --list-tags "$FILENAME" >&2;

echo "Removing location information..." >&2;

FILENAME_UNTAGGED="${FILENAME%.*}_untagged.${FILENAME##*.}"
exif \
    --no-fixup \
    --ifd=GPS \
    --remove \
    --output="$FILENAME_UNTAGGED" \
    "$FILENAME" >&2;

#
# IFD=GPS tags
#
# 0x0003 East or West Longitude
# 0x0004 Longitude
# 0x0005 Altitude Reference
# 0x0006 Altitude
# 0x000e Reference for direction of movement
# 0x000f Direction of Movement
# 0x0010 GPS Image Direction Reference
# 0x0011 GPS Image Direction
# 0x0012 Geodetic Survey Data Used
# 0x0013 Reference For Latitude of Destination
# 0x0014 Latitude of Destination
# 0x0015 Reference for Longitude of Destinatio
# 0x0016 Longitude of Destination
# 0x0017 Reference for Bearing of Destination
# 0x0018 Bearing of Destination
# 0x0019 Reference for Distance to Destination
# 0x001a Distance to Destination
# 0x001b Name of GPS Processing Method
# 0x001c Name of GPS Area
# 0x001e GPS Differential Correction
# 0x001f GPS Horizontal Positioning Error

