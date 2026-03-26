# MBR Generation Prompts

This directory contains prompt templates for generating Monthly Business Reviews (MBRs).

## Quick Start

### Generate MBR for Current Month
```bash
./generate_mbr.sh
```

### Generate MBR for Specific Month
```bash
./generate_mbr.sh 2026-04
```

### Validate Generated MBR
```bash
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md
```

---

## Files

### `generate_mbr_prompt.md`
Master prompt template that covers all 4 phases:
- **Phase 1**: Data Discovery (collect from Salesforce and SIFT)
- **Phase 2**: Content Planning (select observations, risks, highlights)
- **Phase 3**: Writing (generate formatted content)
- **Phase 4**: Validation (check against quality rules)

Template variables:
- `{MONTH}` - Report month (e.g., 2026-04)
- `{MONTH_START}` - First day of month (e.g., 2026-04-01)
- `{MONTH_END}` - Last day of month (e.g., 2026-04-30)

---

## Usage Workflows

### Workflow 1: Fully Automated (Single Pass)

Run generation in one shot:

```bash
./generate_mbr.sh 2026-04
```

Claude will execute all 4 phases sequentially and output the complete MBR.

**Pros**: Fastest approach
**Cons**: No intermediate review checkpoints

---

### Workflow 2: Phased with Manual Checkpoints

Generate with pauses between phases:

```bash
# Phase 1: Data Discovery
claude "Execute Phase 1 only from prompts/generate_mbr_prompt.md for 2026-04.
Stop after data inventory output for my review."

# [Review data inventory]

# Phase 2: Planning
claude "Execute Phase 2 only from prompts/generate_mbr_prompt.md for 2026-04.
Use the data inventory from Phase 1.
Stop after content plan output for my approval."

# [Review and approve content plan]

# Phase 3: Writing
claude "Execute Phase 3 only from prompts/generate_mbr_prompt.md for 2026-04.
Use the approved content plan from Phase 2.
Generate complete MBR draft."

# Phase 4: Validation
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md
```

**Pros**: Control and review at each stage
**Cons**: More manual steps

---

### Workflow 3: Interactive with Claude Code

Use Claude Code's interactive mode:

```bash
claude
```

Then paste the contents of `generate_mbr_prompt.md` with month substituted, and interact as phases complete.

**Pros**: Can ask questions, make adjustments mid-process
**Cons**: Requires active participation

---

## Validation

After generating an MBR, always validate it:

```bash
./validate_mbr.sh MBR_DAS-GenAI_2026-04.md
```

This runs the critique agent from `mbr-critique-agent-prompt.md` and checks:
- Format compliance (no bullets in Q1/Q4, proper [TAG] format in Q2, etc.)
- Data completeness (all 5 groups, exactly 20 in Top 20 table)
- Content quality (names, dates, amounts, competitive context)

### Validation Output

The validation will report:
- **CRITICAL** issues: Fix before submission (format violations, fabricated data)
- **MAJOR** issues: Fix in next revision (missing groups, incomplete data)
- **MINOR** issues: Polish pass (missing details, style improvements)

Final recommendation will be:
- **APPROVE**: Ready for submission
- **REVISE**: Fix major issues
- **REJECT**: Significant problems, needs rewrite

---

## Customization

### Modify the Prompt Template

Edit `generate_mbr_prompt.md` to:
- Change phase instructions
- Add/remove validation checks
- Adjust format requirements
- Include additional context

### Add Month-Specific Context

For months with special circumstances (quarter-end, fiscal year, etc.), add context:

```bash
claude "$(cat prompts/generate_mbr_prompt.md | sed 's/{MONTH}/2026-03/g')

ADDITIONAL CONTEXT FOR MARCH 2026:
- Q1 quarter-end: expect higher PPA closures
- Focus on pipeline build for Q2
- Include re:Invent planning timeline
"
```

---

## Tips

### For Best Results

1. **Run during business hours**: MCP tools need AWS credentials
2. **Check MCP connection**: Verify `aws-sentral-mcp` is running
3. **Review examples**: Look at `outputs/MBR_DAS-GenAI_2026-03.md` for reference
4. **Validate early**: Run validation after Phase 3 to catch issues

### Troubleshooting

**MCP connection errors**:
```bash
# Check MCP server configuration
cat ~/.config/claude/claude_desktop_config.json

# Or check project-level config
cat .mcp.json
```

**Missing data for groups**:
- Check group manager aliases in SIFT search
- Verify Salesforce has opportunities for the month
- Use `[DATA NEEDED: description]` placeholders

**Format violations**:
- Compare against examples in `examples/` directory
- Review format rules in `rules/mbr_format_q*.md`
- Check Phase 4 validation checklist

---

## Next Steps

After successful MBR generation:

1. ✅ Validate with critique agent
2. 📝 Fix any CRITICAL or MAJOR issues
3. 👀 Human review for accuracy and tone
4. 📧 Submit to leadership
5. 📁 Archive in appropriate location

---

## Reference

- **Rules**: `rules/` directory
- **Examples**: `examples/` directory
- **Critique Agent**: `mbr-critique-agent-prompt.md`
- **Development Guide**: `CLAUDE.md`
