#!/usr/bin/env bash
# ==============================================================================
# new_topic.sh - Helper to scaffold a new weekly topic folder and template notes
# ==============================================================================

set -e

# Ensure we run in the repository root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

WEEK_INPUT="$1"
TOPIC_INPUT="$2"

if [ -z "$WEEK_INPUT" ]; then
    read -r -p "👉 Enter Week folder (e.g. 'Week 4' or 'Pyhton Basics/Week 4'): " WEEK_INPUT
fi

if [ -z "$TOPIC_INPUT" ]; then
    read -r -p "👉 Enter Topic name (e.g. 'Data_Visualization_Seaborn' or 'Feature_Engineering'): " TOPIC_INPUT
fi

# Sanitize folder path
TARGET_DIR="${WEEK_INPUT}/${TOPIC_INPUT}"
mkdir -p "$TARGET_DIR"

NOTES_FILE="${TARGET_DIR}/notes.md"
PRACTICE_PY="${TARGET_DIR}/practice.py"

if [ ! -f "$NOTES_FILE" ]; then
    if [ -f "templates/TOPIC_NOTES_TEMPLATE.md" ]; then
        sed -e "s/\[Topic Name\]/${TOPIC_INPUT}/g" \
            -e "s/\[e.g. Week 4\]/${WEEK_INPUT}/g" \
            -e "s/\[YYYY-MM-DD\]/$(date '+%Y-%m-%d')/g" \
            templates/TOPIC_NOTES_TEMPLATE.md > "$NOTES_FILE"
    else
        echo "# ${TOPIC_INPUT}" > "$NOTES_FILE"
    fi
    echo "✅ Created notes file: ${NOTES_FILE}"
fi

if [ ! -f "$PRACTICE_PY" ]; then
    cat <<EOF > "$PRACTICE_PY"
"""
${TOPIC_INPUT} - Practice Script
Date: $(date '+%Y-%m-%d')
"""

def main():
    print("Practicing ${TOPIC_INPUT}...")

if __name__ == "__main__":
    main()
EOF
    echo "✅ Created practice script: ${PRACTICE_PY}"
fi

echo -e "\n🎉 New topic initialized at: ${TARGET_DIR}/"
echo -e "   - Notes:    ${NOTES_FILE}"
echo -e "   - Practice: ${PRACTICE_PY}\n"
