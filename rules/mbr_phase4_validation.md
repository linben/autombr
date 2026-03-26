# Phase 4: Quality Validation

**Part of**: MBR Generation Specification v3.0
**See also**: [mbr-critique-agent-prompt.md](../mbr-critique-agent-prompt.md) for detailed QA rules

## Goal

Verify compliance with all standards before submission. This is a quality gate.

## Validation Checklist

### Format Compliance
- [ ] Q1 is narrative paragraph, NOT bullets
- [ ] Q1 observations are narrative paragraphs, NOT bullets
- [ ] Q2 uses [TAG] format, inline prose, [Next Steps]
- [ ] Q2 has NO STAR labels
- [ ] Q3 is SIFT-sourced only
- [ ] Q4 entries are 3-5 sentence mini-stories
- [ ] Q4 has NO bullets

### Data Completeness
- [ ] All 5 groups in Q1, Q2, Q4, Top 20, Summary
- [ ] Top 20 has exactly 20 entries from Salesforce
- [ ] All numbers from Salesforce, gaps marked [DATA NEEDED]

### Content Quality
- [ ] Named people, dates, $ amounts throughout
- [ ] Competitive context named (GCP, Azure, OpenAI)
- [ ] Every risk has owner + date for next action
- [ ] Zero bullet points in Q1 and Q4

## Validation Actions

**If all checks pass**:
- Mark MBR as ready for submission
- Output validated MBR document

**If any check fails**:
- Stop immediately
- Report specific failure: "Q1 contains bullets (format violation)"
- Do NOT proceed to output
- Request correction or rule clarification
- Return to appropriate phase to fix issues

## Output

Validated MBR ready for submission with confirmation that all quality gates passed.

## Quality Assurance

For additional QA validation, run the critique agent:
- See [mbr-critique-agent-prompt.md](../mbr-critique-agent-prompt.md)
- Reviews output against all rules systematically
- Provides detailed feedback on any violations
