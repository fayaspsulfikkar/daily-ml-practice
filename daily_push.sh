#!/usr/bin/env bash
# ==============================================================================
# daily_push.sh - Automated Daily Learning Sync & GitHub Pusher
# ==============================================================================

set -e

# Terminal colors for clean UI
BOLD='\033[1m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Ensure we run in the repository root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

TODAY=$(date "+%Y-%m-%d")
TIME_NOW=$(date "+%H:%M:%S")

echo -e "\n${BOLD}${CYAN}====================================================${NC}"
echo -e "${BOLD}${CYAN}   🚀 Daily Learning Sync & GitHub Pusher${NC}"
echo -e "${BOLD}${CYAN}   Date: ${TODAY} | Time: ${TIME_NOW}${NC}"
echo -e "${BOLD}${CYAN}====================================================${NC}\n"

# 1. Verify Git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ Error: Not a git repository. Run git init first.${NC}"
    exit 1
fi

CURRENT_BRANCH=$(git branch --show-current)
if [ -z "$CURRENT_BRANCH" ]; then
    CURRENT_BRANCH="main"
fi

# 2. Check git status
CHANGES=$(git status --porcelain)
UNPUSHED=$(git log origin/"$CURRENT_BRANCH"..HEAD 2>/dev/null || true)

if [ -z "$CHANGES" ] && [ -z "$UNPUSHED" ]; then
    echo -e "${GREEN}✨ Everything is clean and up to date! No changes to commit or push.${NC}\n"
    exit 0
fi

# 3. Display detected changes
if [ -n "$CHANGES" ]; then
    echo -e "${YELLOW}📝 Detected changes / practice files:${NC}"
    git status -s
    echo ""
fi

if [ -n "$UNPUSHED" ]; then
    echo -e "${BLUE}📦 You have local commit(s) waiting to be pushed.${NC}"
fi

# 4. Determine commit message / topic
INPUT_MSG="$*"

if [ -z "$INPUT_MSG" ]; then
    echo -e "${BOLD}👉 What topic or practice did you work on today?${NC}"
    echo -e "${CYAN}   (e.g., 'Matplotlib charts and Pandas indexing' or 'Week 4: Feature engineering')${NC}"
    read -r -p "   Summary [Press Enter for auto-summary]: " USER_INPUT
    INPUT_MSG="$USER_INPUT"
fi

if [ -z "$INPUT_MSG" ]; then
    # Auto-generate summary from changed files
    PRACTICE_FILES=""
    while read -r _ file; do
        clean_file="${file%\"}"
        clean_file="${clean_file#\"}"
        # Skip hidden files and meta scripts from headline
        if [[ "$clean_file" != .* ]] && [[ "$clean_file" != daily_push* ]] && [[ "$clean_file" != new_topic* ]]; then
            PRACTICE_FILES="$clean_file, $PRACTICE_FILES"
        fi
    done <<< "$CHANGES"

    if [ -n "$PRACTICE_FILES" ]; then
        INPUT_MSG="Updated ${PRACTICE_FILES%, }"
    else
        INPUT_MSG="Daily study practice and notes"
    fi
fi

COMMIT_TITLE="📚 Practice (${TODAY}): ${INPUT_MSG}"

# 5. Optionally log to DAILY_LOG.md if changes exist
DAILY_LOG_FILE="DAILY_LOG.md"
if [ -f "$DAILY_LOG_FILE" ] && [ -n "$CHANGES" ]; then
    ENTRY_FILE=$(mktemp)
    {
        echo ""
        echo "### 📅 Entry — ${TODAY}"
        echo "- **Topic / Focus:** ${INPUT_MSG}"
        echo "- **Files Updated:**"
        while read -r _ file; do
            clean_file="${file%\"}"
            clean_file="${clean_file#\"}"
            echo "  - \`$clean_file\`"
        done <<< "$CHANGES"
        echo "---"
    } > "$ENTRY_FILE"

    if grep -q "## 📝 Daily Entries" "$DAILY_LOG_FILE"; then
        sed -i "/## 📝 Daily Entries/r $ENTRY_FILE" "$DAILY_LOG_FILE"
        echo -e "${GREEN}✅ Automatically logged today's entry in ${DAILY_LOG_FILE}${NC}"
    fi
    rm -f "$ENTRY_FILE"
fi

# 6. Stage and commit
if [ -n "$CHANGES" ]; then
    echo -e "\n${BLUE}⏳ Staging all changes (git add -A)...${NC}"
    git add -A

    echo -e "${BLUE}💾 Creating commit...${NC}"
    git commit -m "$COMMIT_TITLE"
fi

# 7. Push to GitHub
echo -e "\n${BLUE}🚀 Pushing to GitHub (origin ${CURRENT_BRANCH})...${NC}"
if git push origin "$CURRENT_BRANCH"; then
    echo -e "\n${BOLD}${GREEN}====================================================${NC}"
    echo -e "${BOLD}${GREEN}🎉 SUCCESS! Your daily practice has been pushed!${NC}"
    echo -e "${GREEN}Commit: ${COMMIT_TITLE}${NC}"
    echo -e "${GREEN}GitHub: https://github.com/fayaspsulfikkar/daily-ml-practice${NC}"
    echo -e "${BOLD}${GREEN}====================================================${NC}\n"
else
    echo -e "\n${BOLD}${RED}⚠️  Git push encountered an issue.${NC}"
    echo -e "${YELLOW}Common causes and easy fixes:${NC}"
    echo -e "1. ${BOLD}Authentication:${NC} Run this once to save your GitHub credentials:"
    echo -e "   ${CYAN}git config --global credential.helper store${NC}"
    echo -e "2. ${BOLD}Remote is ahead:${NC} If commits were made directly on GitHub, run:"
    echo -e "   ${CYAN}git pull --rebase origin ${CURRENT_BRANCH}${NC}"
    echo -e "   Then run ${CYAN}./daily_push.sh${NC} again.\n"
    exit 1
fi
