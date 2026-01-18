#!/bin/bash
#
# Proportionally scales JPEG images larger than 1080p down to 1080p resolution
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
if command -v magick >/dev/null 2>&1; then
    CONVERT=magick
else
    CONVERT=convert
fi
if ! command -v $CONVERT >/dev/null 2>&1; then
    echo "Error: $CONVERT not found (Is ImageMagick installed?)" >&2;
    exit 12;
fi

# Check image integrity
identify "$FILENAME" | cut -d" " -f2- >&2
if [ $? != 0 ]; then
    echo "Error: Corrupted image data. Aborting." >&2;
    exit 31;
fi

# Get the image size
WIDTH=$($CONVERT "$FILENAME" -ping -format "%w" info:)
HEIGHT=$($CONVERT "$FILENAME" -ping -format "%h" info:)
SIZE="${WIDTH}x${HEIGHT}px"
echo "Image size: $SIZE" >&2;

# Check if the image is larger than 1080p
if [ $HEIGHT -lt 1080 ]; then
    echo "Image is already smaller than 1080p: $SIZE. Skipping." >&2;
    exit 41;
fi

# Resize the image
echo "Resizing image to 1080p..." >&2;
NEW_FILENAME="${FILENAME%.*}_1080p.${FILENAME##*.}"
$CONVERT -resize x1080 -quality 95 "$FILENAME" "$NEW_FILENAME" >&2
if [ $? != 0 ]; then
    echo "Error: Failed to resize image. Aborting." >&2;
    exit 42;
fi
