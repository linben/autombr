# Q2: Risks/Blockers Format Rules

**Part of**: MBR Generation Specification v3.0
**See also**: [Q2 Examples](../examples/mbr_examples_q2.md)

## Format Type

**[TAG] Inline Prose** - Tagged entries with flowing narrative, NOT STAR format

## Entry Format

```
[TAG] Bold Title. Flowing prose narrative describing the situation,
impact, and context with $ amounts, people, and dates inline.
[Next Steps: specific actions with owner and date].
```

### Tags
- **[R]** Risk - Potential problems, revenue at risk
- **[B]** Blocker - Critical impediments requiring immediate action
- **[C]** Challenge/Competitive - Market dynamics, competitor activity
- **[O]** Observation - Patterns that may need attention

### Priority Order
Present entries in this order: [R] → [B] → [C] → [O]

## Content Requirements

### Must Include Inline

- **Account name** (no size bands or group labels)
- **$ amount** at risk or impacted
- **Specific people** (use "SA" or "AM" role labels, customer contacts, service team members by name)
- **Tools and systems** mentioned
- **Dates** (deadlines, milestones, next actions)
- **Current status** (percentages, progress indicators)

### Entry Structure
1. **Opening**: State the risk/blocker with $ impact
2. **Context**: Why this matters, what's at stake
3. **Current state**: Progress to date, interim milestones
4. **Ownership**: Who's working on it (SA, AM, service team)
5. **Next Steps**: Specific actions with owner name and date

## Critical Rules

### DO:
- Write as flowing prose (like telling a story)
- Include ALL details inline (no separate labels)
- Group related accounts into ONE systemic entry
- Back EVERY entry with Salesforce data or SIFT insights
- Name specific owners for next steps
- Include specific dates for actions

### DO NOT:
- Use STAR format (Situation:/Task:/Action:/Result:)
- Use bullet points or nested structure
- Assume or fabricate risks without SIFT evidence
- Create separate entries for related issues
- Leave next steps vague ("working on it", "monitoring")
- Exceed 3-5 total entries

## Content Scope

**Belongs in Q2**:
- Revenue at risk situations
- Capacity or resource constraints
- Customer escalations affecting multiple accounts
- Service issues blocking deployments
- Competitive threats with $ impact

**Does NOT belong in Q2**:
- Individual customer wins/losses (those go in Q4)
- Cross-account initiatives (those go in Q3)
- General observations without risk (those go in Q1)

## Content Filtration (CRITICAL)

**REMOVE from Q2 if:**

a) **Customer deprioritized by their own business decision**

- Example: "Customer concluded too expensive, reassessing"
- This is customer choice, not an AWS blocker
- → Move to Q1 observations instead

b) **Customer "exploring" with no $ at risk and no timeline pressure**

- Example: "Customer exploring GenAI use cases, no committed ARR yet"
- This is exploratory, not a risk requiring leadership action
- → Move to Q1 observations instead

c) **Customer waiting on their own internal process, not on AWS**

- Example: "Customer pending internal budget approval"
- AWS is not the blocker, customer internal process is
- → Move to Q1 observations instead

**Q2 Litmus Test**: "What is at risk RIGHT NOW that leadership must act on?"

- If answer is "nothing yet, monitoring" → Q1 observations
- If answer is "customer reassessing due to their own constraints" → Q1 observations
- If answer is "AWS dependency blocking progress with $ at stake" → Q2 blocker/risk

**Why This Matters**: Q2 is for actionable systemic issues requiring leadership intervention. Filling Q2 with non-actionable items dilutes urgent issues and wastes leadership attention.

## Action Tags

### [Next Steps] Format

Use `[Next Steps: specific action with owner name and date]` at the end of each entry to document committed actions:

**Example**: `[Next Steps: Executive sponsor call scheduled 2026-03-28, owner Sarah Chen]`

**Requirements**:
- Owner must be a specific person (not "team" or "group")
- Date must be specific (not "Q2" or "soon")
- Action must be concrete and traceable

## Anti-Duplication Rule (CRITICAL)

**Each account appears in ONE quadrant only.**

- Accounts featured in Q2 risks → do NOT repeat in Q4
- Accounts featured in Q1 observations → do NOT repeat in Q4
- Choose the quadrant that best represents the primary insight for THIS month

**See also**: [mbr_format_q4.md](mbr_format_q4.md) Anti-Duplication Rule section

## Quality Checks

Before considering Q2 complete, verify:

- [ ] All entries use [TAG] format
- [ ] NO STAR labels (Situation:/Task:/Action:/Result:)
- [ ] Entries are pure prose narrative
- [ ] All entries have specific $ amounts
- [ ] All entries name specific people (use "SA"/"AM" role labels, not individual names)
- [ ] All entries have dates for next steps
- [ ] Priority order followed: [R] → [B] → [C] → [O]
- [ ] 3-5 entries maximum (prioritize depth over quantity)
- [ ] Every entry backed by Salesforce/SIFT data
- [ ] Content filtration applied (Q2 litmus test: "What is at risk RIGHT NOW?")
- [ ] All 5 territory groups represented (data from all groups, NO group labels in narrative)
- [ ] NO size bands (L/XL/XXL) in narrative text
- [ ] NO group references (DASGENAI-*) in narrative text
- [ ] NO individual AM/DM/SA names in narrative text
- [ ] Customer executive names and PM names ARE allowed
- [ ] If group data missing, documented with [DATA NEEDED: {group}]
- [ ] Accounts in Q2 risks will NOT be repeated in Q4
