# Generate MBR for Month: {MONTH}

Generate a complete Monthly Business Review (MBR) for the AWS DAS-GenAI district following the 4-phase process.

**IMPORTANT: Output File Creation**
- **Create a NEW file** - Do NOT modify or update existing MBR files
- The script automatically handles versioning if the base filename exists
- Each generation run produces a separate, independent document

---

## Phase 1: Data Discovery

**Rules**: [rules/mbr_phase1_data_discovery.md](../rules/mbr_phase1_data_discovery.md)

**Data Collection Tasks**:

### 1.1 Collect Business Metrics
- Use `search_opportunities` MCP tool with ownershipFilter for each group manager:
  - West-A: conwachr
  - East-A: hdevore
  - West-B: artisvan, capotts
  - GenAI-A: maxtynan, jdarcy
  - East-B: acomstoc, perkiand
- Get revenue vs quota by group
- Calculate YTD attainment percentages
- Pull AI revenue and NNIR data
- Get tech engagement rates (Core and GenAI pipeline)

### 1.2 Collect SIFT Insights

**CRITICAL**: Execute batch search strategy from [rules/mbr_data_sources.md](../rules/mbr_data_sources.md) Rule 4.

- Search ALL 10 batches covering ~70 aliases (SA teams + AM teams + managers)
- Use `sift_insights_search` MCP tool for each batch:
  - dateRangeStart: {MONTH_START} (e.g., 2026-04-01)
  - dateRangeEnd: {MONTH_END} (e.g., 2026-04-30)
  - createdBy: [batch_aliases] (see Rule 4 for complete batch lists)
- Aggregate results across all 10 batches
- Categorize insights: [H], [L], [O], [R], [B], [C]
- Identify cross-account patterns for Q3

**Why This Matters**: Searching only manager aliases (~10) misses 60+ SA/AM contributors, resulting in incomplete Q4 SA-led content.

### 1.3 Collect Top Opportunities
- Use `search_opportunities` with:
  - Sort: annualized_Revenue__c DESC
  - Limit: 20+
- Ensure all 5 groups represented
- Get: stage, close date, competitor, signal

### 1.4 Validate Data Completeness
- Check all 5 groups have data
- Mark gaps: [DATA NEEDED: description]
- Document any API errors or missing sources

**Output**: Data inventory showing which sources were queried, which groups have complete data, and any gaps.

---

## Error Handling During Data Discovery

**Reference**: [rules/mbr_error_handling.md](../rules/mbr_error_handling.md)

If MCP tools return incomplete data, follow these protocols:

### Missing Data Scenarios

- **No opportunities for a group**: Document `[DATA NEEDED: Salesforce opportunities for DASGENAI-{GROUP}]` and continue with available data
- **SIFT returns 0 insights for a manager**: Note "No SIFT insights found for {manager} in last 30 days" and check if other group managers have insights
- **Fewer than 20 opportunities total**: Include all available opportunities in Top 20 table and note the discrepancy: "Only {N} opportunities met criteria"
- **Missing account spend data**: Mark `[DATA NEEDED: Spend data for {account}]` and omit YoY growth if unavailable

### Connection and API Failures

- **Connection timeout**: Retry up to 3 times with exponential backoff (1s, 2s, 4s), then document gap and proceed
- **Rate limiting**: Implement exponential backoff, retry with delay
- **Authentication error**: Check AWS credentials and MCP server configuration before proceeding
- **Tool unavailable**: Document which tool failed and what data is missing

### Data Quality Issues

- **Ambiguous or conflicting data**: Use most recent source, note discrepancy if material
- **Missing required fields** (stage, close date): Include opportunity but mark field as "Unknown"
- **Unclear SIFT categorization**: Default to observed category from SIFT, don't reclassify

### Critical Rule

**Never fabricate or estimate numbers**. Always use:
- `[DATA NEEDED: description]` for missing sources
- Actual data from MCP tools only
- Explicit notes about data gaps in final output

---

## Phase 2: Content Planning

**Rules**: [rules/mbr_phase2_planning.md](../rules/mbr_phase2_planning.md)

**Planning Tasks**:

### 2.1 Plan Q1 (Health of Business)
- Draft key metrics for opening paragraph (see rules/mbr_format_q1.md)
- Select 3-5 top observations with accounts named
- Ensure no generic preambles, only new content
- Verify all 5 groups represented

### 2.2 Plan Q2 (Risks/Blockers)
- Select 4-6 most critical items
- Prioritize: [R] → [B] → [C] → [O]
- Group systemic issues (don't repeat similar risks)
- Assign owner and next step date for each

### 2.3 Plan Q3 (#OneTeam)
- Filter SIFT-sourced initiatives only
- Verify SA engagement and pipeline impact documented
- Exclude account-level observations (those go in Q1/Q4)
- Use placeholder if no verified initiatives found

### 2.4 Plan Q4 (Highlights/Lowlights)
- Select 5-8 highlights with business impact
- Select 3-5 lowlights with lessons learned
- Ensure each has mini-story arc (what/why/next)
- Include competitive context where relevant

**Output**: Content outline with item selection checklist for approval before writing begins.

### Phase 1 → Phase 2 Gate

Proceed if:

- [ ] MCP tools returned data for all 5 groups OR gaps documented with [DATA NEEDED]
- [ ] At least 20 opportunities retrieved for Top 20 table (or all available documented)
- [ ] SIFT insights retrieved for at least 3 of 5 group managers

If gate fails: Document gaps and proceed with available data (do NOT fabricate).

### Phase 2 → Phase 3 Gate

Self-review before proceeding to writing:

- [ ] Content outline covers all 4 quadrants + appendices
- [ ] All 5 groups represented in planned content
- [ ] Q3 initiatives are SIFT-verified (not account-level observations)
- [ ] Q2 risks have identified owners and next step dates
- [ ] Entry counts within range: Q2 (4-6), Q4 Highlights (5-8), Q4 Lowlights (3-5)

If gate fails: Revise outline to address missing coverage or format issues.

---

## Phase 3: Writing

**Rules**: [rules/mbr_phase3_writing.md](../rules/mbr_phase3_writing.md)

### 3.1 Write Q1 (Health of Business)

**Format Rules**: [rules/mbr_format_q1.md](../rules/mbr_format_q1.md)
**Examples**: [examples/mbr_examples_q1.md](../examples/mbr_examples_q1.md)

**Requirements**:
- Write as single flowing paragraph (NOT bullets)
- Include all 8 business metrics with specific numbers:
  1. Revenue vs quota with attainment %
  2. YoY growth %
  3. Top 3 NNIR drivers with $ amounts and YoY %
  4. AI revenue vs quota
  5. AI NNIR with top 3 AI drivers
  6. Next month forecast
  7. YTD position ($ amount, % to goal)
  8. Tech engagement rates (Core and GenAI pipeline %)
- Follow with 3-5 narrative observation paragraphs (3-5 lines each)
- Each observation: pattern → accounts → $ ARR → [Ask]

### 3.2 Write Q2 (Risks/Blockers)

**Format Rules**: [rules/mbr_format_q2.md](../rules/mbr_format_q2.md)
**Examples**: [examples/mbr_examples_q2.md](../examples/mbr_examples_q2.md)

**Requirements**:
- Format: [TAG] **Bold Title.** Inline prose. [Next Steps] at end
- NO STAR format (avoid labels like Situation:/Task:/Action:/Result:)
- Priority order: [R] → [B] → [C] → [O]
- 4-6 entries maximum
- Each entry must include: account name, size band, $ amount, specific people, dates, current status

### 3.3 Write Q3 (#OneTeam)

**Format Rules**: [rules/mbr_format_q3.md](../rules/mbr_format_q3.md)
**Examples**: [examples/mbr_examples_q3.md](../examples/mbr_examples_q3.md)

**Requirements**:
- ONLY SIFT-sourced cross-account technical patterns
- Must document SA engagement and pipeline impact
- Each initiative must include:
  - SIFT source citation (creator alias, date)
  - Initiative type (workshop, reference architecture, etc.)
  - Number of accounts engaged
  - Pipeline impact ($ amount or account count)
  - Specific customer names
  - SA deliverable produced
  - Scaling plans with codes (TFC-####, GTM-####)
- If none found, use placeholder from rules/mbr_format_q3.md

### 3.4 Write Q4 (Highlights/Lowlights)

**Format Rules**: [rules/mbr_format_q4.md](../rules/mbr_format_q4.md)
**Examples**: [examples/mbr_examples_q4.md](../examples/mbr_examples_q4.md)

**Requirements**:
- Format: [H]/[L] **Bold Title.** 3-5 sentence mini-story. [Next Steps]
- NO STAR format (avoid labels like Situation:/Task:/Action:/Result:), pure narrative
- Include competitive context within story
- Highlights: 5-8 entries | Lowlights: 3-5 entries
- Each entry must tell complete story: what/why/how/competitive/next

### 3.5 Generate Appendices

**Structure Rules**: [rules/mbr_document_structure.md](../rules/mbr_document_structure.md)

**Appendix F: Top 20 Opportunities by ARR**
- Table format with columns: Account | Group | Stage | ARR | Close Date | Competitor | Signal
- **Must have exactly 20 entries**
- All 5 groups must be represented
- Sort by ARR descending

**Appendix G: Territory Group Summary**
- Table format with columns: Group | Manager | Q1 Closed Won | Active Pipeline | Key Accounts | Top Risk
- **Must have all 5 groups**
- Include district totals

**Output**: Complete MBR draft in 2x2 format ready for validation.

---

## Phase 4: Quality Validation

**Rules**: [rules/mbr_phase4_validation.md](../rules/mbr_phase4_validation.md)
**Critique Agent**: [mbr-critique-agent-prompt.md](../mbr-critique-agent-prompt.md)

### Step 4.1: Write MBR to File

Write the complete MBR document to: `outputs/MBR_DAS-GenAI_{MONTH}.md`

**IMPORTANT**:
- Create a NEW file with the complete content
- Do NOT update or edit any existing files
- The script handles auto-versioning if needed

### Step 4.2: Automated Critique Validation

**Use the Agent tool to launch a critique subagent:**

```python
Agent(
    subagent_type="general-purpose",
    description="Validate MBR against quality rules",
    prompt=f"""
Read the MBR critique agent prompt from mbr-critique-agent-prompt.md and the generated MBR from outputs/MBR_DAS-GenAI_{MONTH}.md.

Execute all 18 validation checks from the critique agent specification:
- Phase 1: Format Compliance (Rules 1.1-1.10)
- Phase 2: Data Completeness (Rules 2.1-2.3)
- Phase 3: Content Quality (Rules 3.1-3.5)

Report findings in the structured format with:
1. Rule-by-rule assessment with evidence
2. Compliance score summary
3. Final recommendation (APPROVE/REVISE/REJECT)

Focus on CRITICAL and MAJOR issues that must be fixed.
"""
)
```

### Step 4.3: Report Validation Results

The critique agent will report:

**Compliance Score Summary:**
- PASS count (rules satisfied)
- CRITICAL issues (fix before submission)
- MAJOR issues (fix in next revision)
- MINOR issues (polish pass)
- Recommendation: APPROVE / REVISE / REJECT

**Thresholds:**
- **APPROVE**: 0 Critical, ≤2 Major
- **REVISE**: 1-2 Critical OR 3-5 Major
- **REJECT**: 3+ Critical OR 6+ Major

### Step 4.4: Final Output

**If validation passes (APPROVE):**
- ✅ Output the MBR file location
- ✅ Report compliance rate
- ✅ Document is ready for submission

**If validation fails (REVISE/REJECT):**
- ⚠️ Report specific issues found
- ⚠️ List required fixes
- ⚠️ Suggest re-running after corrections

**Output**: Validated MBR document with quality assessment report

---

## Output Format

**Filename**: `outputs/MBR_DAS-GenAI_{MONTH}.md`

**CRITICAL: File Creation Rule**
- **Always create a NEW output file** - Never edit or update existing MBR files
- Write the complete document as fresh content
- The generation script handles filename versioning automatically (e.g., `_v2`, `_v3` if base file exists)
- Each generation run is independent and produces a standalone document

**Reference Example**: [MBR_DAS-GenAI_2026-03.md](../outputs/MBR_DAS-GenAI_2026-03.md)

**Document Structure**:
```
# DAS-GenAI District Monthly Business Review
## {MONTH}

---

# Q1: Health of Business & Top Business Observations
[Single narrative paragraph with all 8 metrics]
[3-5 narrative observation paragraphs]

---

# Q2: Observations, Challenges, Risks & Blockers
[4-6 [TAG] entries in priority order]

---

# Q3: #OneTeam Tech Initiatives
[SIFT-sourced cross-account initiatives]

---

# Q4: Customer Highlights & Lowlights
[5-8 [H] highlights]
[3-5 [L] lowlights]

---

# Appendix F: Top 20 Opportunities by ARR
[Table with exactly 20 entries]

---

# Appendix G: Territory Group Summary
[Table with all 5 groups]

---

# Data Completeness Notes
[List what data was collected and any gaps]
```

---

## Critical Requirements

### ✓ All 5 Groups Represented
- DAS-GenAI-West-A (DASGENAI-WEST-A)
- DAS-GenAI-East-A (DASGENAI-EAST-A)
- DAS-GenAI-West-B (DASGENAI-WEST-B)
- DAS-GenAI-GenAI-A (DASGENAI-GENAI-A)
- DAS-GenAI-East-B (DASGENAI-EAST-B)

### ✓ Zero Bullets in Q1/Q4
- Q1 must be flowing narrative paragraphs
- Q4 must be 3-5 sentence mini-stories
- NO bullet points (-, *, •) allowed

### ✓ Top 20 Has Exactly 20 Entries
- Pull from Salesforce opportunities
- Sort by annualized_Revenue__c DESC
- All 5 groups must appear in table

### ✓ All Numbers from Salesforce/SIFT
- Never fabricate or estimate data
- Use [DATA NEEDED: description] for gaps
- Back every claim with source data

### ✓ Proper Formatting
- Q2: [TAG] inline prose, NO STAR format
- Q3: SIFT citations required (creator, date)
- Q4: Include competitive context inline
- All risks must have owner + date

### ✓ Account Details
- Name accounts with size bands (L/XL/XXL)
- Include group assignments (DASGENAI-*)
- Show $ amounts and YoY percentages
- Reference specific people and dates

---

## MCP Tools Reference

**Available via aws-sentral-mcp server**:

- `search_opportunities` - Query Salesforce opportunities
  - ownershipFilter: group manager aliases
  - Sort by: annualized_Revenue__c DESC

- `get_account_spend_summary` - Account spend totals
  - Returns: totalSpend, YoYGrowth

- `get_account_spend_by_service` - Service-level breakdown
  - Returns: serviceName, spend, YoYGrowth

- `sift_insights_search` - Search SIFT insights
  - dateRangeStart/End: ISO 8601 format
  - createdBy: manager aliases
  - Returns: title, description, category, createdAt, createdBy

---

## Execution Notes

1. **Create new file only**: Generate a complete NEW document - never edit or update existing MBR files
2. **Follow phases in order**: Don't skip to writing without data collection and planning
3. **Stop at checkpoints**: Phase 2 output should be reviewed before proceeding to Phase 3
4. **Validate continuously**: Check format rules as you write each section
5. **Use real data only**: Never fabricate - use [DATA NEEDED] for gaps
6. **Reference examples**: Use good/bad examples from examples/ directory as patterns

---

**Ready to generate? Execute this prompt with the month parameter filled in.**
