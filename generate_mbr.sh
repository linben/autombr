#!/bin/bash
# Generate MBR using the prompt template
# Usage: ./generate_mbr.sh [YYYY-MM]

set -e

# Get month parameter (default to current month)
MONTH=${1:-$(date +%Y-%m)}

# Calculate month start and end dates
MONTH_START="${MONTH}-01"
# Get last day of month
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    MONTH_END=$(date -j -v1d -v+1m -v-1d -f "%Y-%m-%d" "${MONTH_START}" +%Y-%m-%d)
else
    # Linux
    MONTH_END=$(date -d "${MONTH_START} +1 month -1 day" +%Y-%m-%d)
fi

echo "🚀 Generating MBR for ${MONTH}"
echo "📅 Date range: ${MONTH_START} to ${MONTH_END}"
echo ""

# Load and substitute the prompt template
PROMPT=$(cat prompts/generate_mbr_prompt.md | \
    sed "s/{MONTH}/${MONTH}/g" | \
    sed "s/{MONTH_START}/${MONTH_START}/g" | \
    sed "s/{MONTH_END}/${MONTH_END}/g")

# Ensure outputs directory exists
mkdir -p outputs

# Auto-increment output filename if file already exists
BASE_OUTPUT_FILE="outputs/MBR_DAS-GenAI_${MONTH}.md"
OUTPUT_FILE="${BASE_OUTPUT_FILE}"
VERSION=2

if [ -f "${BASE_OUTPUT_FILE}" ]; then
    echo "ℹ️  ${BASE_OUTPUT_FILE} already exists"

    # Find next available version number
    while [ -f "outputs/MBR_DAS-GenAI_${MONTH}_v${VERSION}.md" ]; do
        VERSION=$((VERSION + 1))
    done

    OUTPUT_FILE="outputs/MBR_DAS-GenAI_${MONTH}_v${VERSION}.md"
    echo "✅ Auto-incremented to: ${OUTPUT_FILE}"
    echo ""
fi

echo "📝 Starting MBR generation..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Execute with Claude
echo "${PROMPT}" | claude

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ MBR generation complete!"
echo "📄 Expected output: ${OUTPUT_FILE}"
echo ""
echo "Next steps:"
echo "  1. Review the generated MBR document"
echo "  2. Run validation: ./validate_mbr.sh ${OUTPUT_FILE}"
echo "  3. Make any necessary corrections"
echo ""
