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
- **Account name** with size band (L/XL/XXL)
- **$ amount** at risk or impacted
- **Specific people** (SA names, customer contacts, service team members)
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
- Exceed 4-6 total entries

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

## Action Tags

### [Next Steps] Format

Use `[Next Steps: specific action with owner name and date]` at the end of each entry to document committed actions:

**Example**: `[Next Steps: Executive sponsor call scheduled 2026-03-28, owner Sarah Chen]`

**Requirements**:
- Owner must be a specific person (not "team" or "group")
- Date must be specific (not "Q2" or "soon")
- Action must be concrete and traceable

## Quality Checks

Before considering Q2 complete, verify:

- [ ] All entries use [TAG] format
- [ ] NO STAR labels (Situation:/Task:/Action:/Result:)
- [ ] Entries are pure prose narrative
- [ ] All entries have specific $ amounts
- [ ] All entries name specific people
- [ ] All entries have dates for next steps
- [ ] Priority order followed: [R] → [B] → [C] → [O]
- [ ] 4-6 entries maximum
- [ ] Every entry backed by Salesforce/SIFT data
- [ ] All 5 territory groups represented (DASGENAI-WEST-A, DASGENAI-EAST-A, DASGENAI-WEST-B, DASGENAI-GENAI-A, DASGENAI-EAST-B)
- [ ] If group data missing, documented with [DATA NEEDED: {group}]
