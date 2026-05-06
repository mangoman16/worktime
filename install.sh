#!/bin/bash
# Install worktime by symlinking it into a directory on $PATH.
# Usage:
#   ./install.sh                # installs to ~/.local/bin/worktime
#   ./install.sh /usr/local/bin # installs there instead

set -eu

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SRC_DIR/worktime.sh"
DEST_DIR="${1:-$HOME/.local/bin}"
DEST="$DEST_DIR/worktime"

if [ ! -f "$SRC" ]; then
    echo "worktime.sh not found at $SRC" >&2
    exit 1
fi

mkdir -p "$DEST_DIR"
chmod +x "$SRC"
ln -sf "$SRC" "$DEST"

echo "linked $DEST -> $SRC"
case ":$PATH:" in
    *":$DEST_DIR:"*) ;;
    *) echo "note: $DEST_DIR is not on \$PATH — add it to your shell rc" ;;
esac
