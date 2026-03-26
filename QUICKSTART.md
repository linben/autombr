# MBR Generation Quick Start

## 🚀 Generate MBR in One Command

```bash
./generate_mbr.sh 2026-04
```

This will:
1. ✅ Query Salesforce and SIFT for data
2. ✅ Plan content for all 4 quadrants
3. ✅ Write formatted MBR document
4. ✅ Run quality validation
5. ✅ Output `MBR_DAS-GenAI_2026-04.md`

---

## 📋 Validate Existing MBR

```bash
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md
```

---

## 🔧 Prerequisites

### 1. Claude Code CLI
Ensure Claude Code is installed and authenticated:
```bash
claude --version
```

### 2. MCP Server Connection
Verify `aws-sentral-mcp` is configured in `.mcp.json`:
```json
{
  "mcpServers": {
    "aws-sentral-mcp": {
      "command": "aws-sentral-mcp",
      "args": []
    }
  }
}
```

### 3. Test MCP Connection
```bash
claude "List available MCP tools from aws-sentral-mcp server"
```

Should show tools like:
- `search_opportunities`
- `get_account_spend_summary`
- `sift_insights_search`
- etc.

---

## 📁 What Gets Generated

```
MBR_DAS-GenAI_2026-04.md    ← Main output
├── Q1: Health of Business (narrative paragraphs)
├── Q2: Risks/Blockers ([TAG] inline prose)
├── Q3: #OneTeam Initiatives (SIFT-sourced)
├── Q4: Highlights/Lowlights (mini-stories)
├── Appendix F: Top 20 Opportunities (table)
└── Appendix G: Territory Group Summary (table)
```

---

## ⚡ Quick Commands

### Generate for current month
```bash
./generate_mbr.sh
```

### Generate for specific month
```bash
./generate_mbr.sh 2026-05
```

### Validate generated MBR
```bash
./validate_mbr.sh MBR_DAS-GenAI_2026-05.md
```

### View prompt template
```bash
cat prompts/generate_mbr_prompt.md
```

### Check repository consistency
```bash
claude "Review the repo to ensure consistency throughout"
```

---

## 🎯 Common Workflows

### Monthly Generation (Standard)
```bash
# Generate for April 2026
./generate_mbr.sh 2026-04

# Validate output
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md

# Fix any issues and regenerate if needed
```

### Phase-by-Phase (With Review Checkpoints)
```bash
# Phase 1: Data Discovery
claude "Execute Phase 1 from prompts/generate_mbr_prompt.md for 2026-04"
# Review data inventory

# Phase 2: Planning
claude "Execute Phase 2 from prompts/generate_mbr_prompt.md for 2026-04"
# Approve content plan

# Phase 3: Writing
claude "Execute Phase 3 from prompts/generate_mbr_prompt.md for 2026-04"

# Phase 4: Validation
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md
```

---

## ✅ Quality Checklist

After generation, verify:
- [ ] All 5 groups represented (West-A, East-A, West-B, GenAI-A, East-B)
- [ ] Q1 has NO bullet points (narrative paragraphs only)
- [ ] Q2 uses [TAG] format with NO STAR labels
- [ ] Q3 has SIFT citations (creator, date)
- [ ] Q4 has NO bullet points (3-5 sentence mini-stories)
- [ ] Top 20 table has exactly 20 entries
- [ ] All numbers from Salesforce/SIFT (no fabricated data)
- [ ] Every risk has owner + specific date
- [ ] Competitive context included where relevant

---

## 🆘 Troubleshooting

### MCP Tools Not Available
```bash
# Check configuration
cat .mcp.json

# Test connection
claude "Test connection to aws-sentral-mcp and list available tools"
```

### Missing Data for Groups
- Check SIFT search date range (last 30 days)
- Verify group manager aliases correct
- Use `[DATA NEEDED: description]` for gaps

### Format Violations
- Compare against `MBR_DAS-GenAI_2026-03.md` (reference example)
- Review rules in `rules/mbr_format_q*.md`
- Check examples in `examples/mbr_examples_q*.md`

### Validation Failures
```bash
# Review specific issues
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md | grep "CRITICAL\|MAJOR"

# Fix and regenerate
vim MBR_DAS-GenAI_2026-04.md

# Re-validate
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md
```

---

## 📚 Documentation

- **Full Details**: [prompts/README.md](prompts/README.md)
- **Development Guide**: [CLAUDE.md](CLAUDE.md)
- **Critique Agent**: [mbr-critique-agent-prompt.md](mbr-critique-agent-prompt.md)
- **Format Rules**: [rules/](rules/) directory
- **Examples**: [examples/](examples/) directory

---

## 🎓 Understanding the 4 Phases

### Phase 1: Data Discovery
Collect all required data before writing. Read-only phase.
- Query Salesforce opportunities (all 5 groups)
- Search SIFT insights (last 30 days)
- Pull Top 20 opportunities by ARR
- Validate data completeness

### Phase 2: Content Planning
Outline content structure before writing.
- Plan Q1 metrics and observations (3-5)
- Select Q2 risks/blockers (4-6)
- Identify Q3 SIFT-sourced initiatives
- Choose Q4 highlights (5-8) and lowlights (3-5)

### Phase 3: Writing
Generate narrative following style rules.
- Write Q1 as narrative paragraphs
- Write Q2 as [TAG] inline prose
- Write Q3 with SIFT citations
- Write Q4 as mini-stories
- Generate appendices (Top 20, Group Summary)

### Phase 4: Validation
Verify compliance with all standards.
- Check format rules (no bullets in Q1/Q4, etc.)
- Verify data completeness (all 5 groups, 20 in Top 20)
- Validate content quality (names, dates, amounts)
- Report violations and fix before submission

---

## 💡 Tips for Success

1. **Run during business hours** - MCP tools need AWS credentials
2. **Review Phase 2 output** - Approve content plan before writing
3. **Use real data only** - Never fabricate, use `[DATA NEEDED]` for gaps
4. **Validate early** - Catch format issues before full generation
5. **Reference examples** - Use `MBR_DAS-GenAI_2026-03.md` as guide

---

**Ready to generate your first MBR?**

```bash
./generate_mbr.sh
```
