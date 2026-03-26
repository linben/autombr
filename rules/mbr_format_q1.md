# Q1: Health of Business Format Rules

**Part of**: MBR Generation Specification v3.0
**See also**: [Q1 Examples](../examples/mbr_examples_q1.md)

## Format Type

**Narrative Paragraph** - Flowing prose, NOT bullets

## Structure

### Opening Paragraph: Business Metrics

Write as a single flowing paragraph including:
- Revenue vs quota with specific $ amounts
- Attainment percentage (e.g., "103% of $45.8M quota")
- YoY growth percentage
- Top 3 NNIR drivers with $ amounts and YoY %
- AI revenue vs quota with specific $ amounts
- AI NNIR with top 3 AI drivers ($ amounts, YoY %)
- Next month forecast ($ amount)
- YTD position ($ amount, % to goal)
- Tech engagement rates (Core pipeline %, GenAI pipeline %)

**Style**: Earnings-call format with specific numbers inline

### Top Business Observations

**Format**: 3-5 separate observation paragraphs (each 3-5 sentences)

- Each observation is a standalone paragraph addressing one pattern or theme
- Each paragraph should be 3-5 sentences long
- Total: 3-5 observations (NOT 3-5 sentences total)

**Pattern for Each Observation**:

1. Pattern headline (the trend/insight)
2. Named accounts with size band (L/XL/XXL) and group
3. $ ARR amounts inline
4. [Ask] at end for action items

**Example Flow**:

"Pattern: [trend description]. [Account1] [action] $X.XM ARR [detail]. [Account2] [action] $X.XM ARR [detail]. [Ask: specific request]."

## Critical Rules

### DO:
- Write as flowing narrative paragraphs
- Include specific $ amounts and % figures
- Name accounts (account name only, no size bands or group labels)
- Lead with NEW content specific to this month
- Use concrete examples
- Use "AM" or "SA" as role labels (no individual names)
- Name customer executives (CEO, CTO, etc.) when relevant
- Name product managers when referencing AWS contacts

### DO NOT:
- Use bullet points anywhere in Q1
- Repeat generic preamble lines across months
- Use vague language ("good", "several", "many")
- Include observations without account names
- Omit dollar amounts or YoY percentages
- Include size bands (XXL, XL, L, M) in narrative text
- Include group references (DASGENAI-WEST-A, etc.) in narrative text
- Name individual AMs, DMs, or SAs in narrative text

## Content Scope

**Belongs in Q1**:
- Revenue and business performance metrics
- Account-level growth and expansion patterns
- Technology adoption trends across multiple accounts
- Pipeline health and tech engagement
- Top revenue drivers and their YoY performance

**Does NOT belong in Q1**:
- Individual customer wins (those go in Q4 Highlights)
- Risks or blockers (those go in Q2)
- Cross-account initiatives (those go in Q3 if SIFT-sourced)

## Action Tags

### [Ask] Format

Use `[Ask: specific request]` at the end of observations when requesting support from other teams (service teams, GTM, SA leadership):

**Example**: `[Ask: Service team support for S3 Tables ISV integration patterns]`

**Use Cases**:
- Requesting service team engagement or features
- Asking for GTM support or programs
- Seeking SA leadership guidance or resources
- Requesting technical enablement or documentation

**Contrast with [Next Steps]**: Use [Ask] when you need help from others. Use [Next Steps] (in Q2/Q4) when documenting committed actions you/your team will take.

## Anti-Duplication Rule (CRITICAL)

**Each account appears in ONE quadrant only.**

- Accounts featured in Q1 observations → do NOT repeat in Q4
- Accounts featured in Q2 risks → do NOT repeat in Q4
- Choose the quadrant that best represents the primary insight for THIS month
- If account has multiple stories, pick the most important one for this report

**See also**: [mbr_format_q4.md](mbr_format_q4.md) Anti-Duplication Rule section

## Quality Checks

Before considering Q1 complete, verify:

- [ ] Zero bullet points used
- [ ] All 5 groups represented in content (data from all groups, but NO group labels like "DASGENAI-WEST-A" in text)
- [ ] Specific $ amounts and % included
- [ ] Each observation has named accounts (account name only, NO size bands like L/XL/XXL)
- [ ] [Ask] included where appropriate
- [ ] Content is NEW for this month (not generic)
- [ ] If group data missing, documented with [DATA NEEDED: {group}]
- [ ] Accounts in Q1 observations will NOT be repeated in Q4
- [ ] NO individual AM/DM/SA names in narrative (use "AM" or "SA" as role labels only)
- [ ] Customer executive names ARE allowed (CEO, CTO, etc.)
- [ ] PM names ARE allowed (when referencing product contacts)
