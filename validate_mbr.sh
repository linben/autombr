#!/bin/bash
# Validate MBR document against rules using critique agent
# Usage: ./validate_mbr.sh [MBR_FILE]

set -e

# Get MBR file parameter
MBR_FILE=${1}

if [ -z "${MBR_FILE}" ]; then
    echo "Usage: ./validate_mbr.sh <MBR_FILE>"
    echo ""
    echo "Examples:"
    echo "  ./validate_mbr.sh outputs/MBR_DAS-GenAI_2026-04.md"
    echo "  ./validate_mbr.sh MBR_DAS-GenAI_2026-04.md  (auto-checks outputs/)"
    exit 1
fi

# Check if file exists, try outputs/ directory if not found
if [ ! -f "${MBR_FILE}" ]; then
    # Try outputs/ directory
    if [ -f "outputs/${MBR_FILE}" ]; then
        MBR_FILE="outputs/${MBR_FILE}"
    else
        echo "❌ Error: File not found: ${MBR_FILE}"
        echo "   Also checked: outputs/${MBR_FILE}"
        exit 1
    fi
fi

echo "🔍 Validating MBR: ${MBR_FILE}"
echo "📋 Using critique agent: mbr-critique-agent-prompt.md"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Load critique agent prompt and MBR document
CRITIQUE_PROMPT=$(cat mbr-critique-agent-prompt.md)
MBR_CONTENT=$(cat "${MBR_FILE}")

# Build validation prompt
VALIDATION_PROMPT=$(cat <<EOF
${CRITIQUE_PROMPT}

---

# MBR Document to Review

${MBR_CONTENT}

---

Execute all 18 validation checks from the critique agent specification above.
Report findings in the structured format with rule-by-rule assessment.
End with the compliance summary and recommendation (APPROVE/REVISE/REJECT).
EOF
)

# Execute validation with Claude
echo "${VALIDATION_PROMPT}" | claude

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Validation complete!"
echo ""
echo "Review the validation report above for:"
echo "  - CRITICAL issues (fix before submission)"
echo "  - MAJOR issues (fix in next revision)"
echo "  - MINOR issues (polish pass)"
echo ""
