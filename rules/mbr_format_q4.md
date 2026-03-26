# Q4: Highlights/Lowlights Format Rules

**Part of**: MBR Generation Specification v3.0
**See also**: [Q4 Examples](../examples/mbr_examples_q4.md)

## Format Type

**Mini-Story Narrative** - 3-5 sentence stories with [H]/[L] tags, NOT bullets

## Entry Format

```
[H]/[L] Bold Title. [3-5 sentence narrative story with $ amounts, people,
and competitive context inline]. [Next Steps: specific actions with owner
and date].
```

### Tags
- **[H]** Highlight - Wins, successes, positive outcomes
- **[L]** Lowlight - Setbacks, challenges, lessons learned

## Story Structure

Each entry must be a **3-5 sentence flowing narrative** that naturally incorporates these elements. The numbered lists below are **thinking frameworks** for composing your narrative, NOT section headers to use in output.

### Highlight Mini-Story Elements

Your narrative should weave together:

- **What happened**: Account, action, $ impact, YoY growth
- **Why it matters**: Business driver, technical benefit, competitive win
- **How we did it**: SA engagement, technical deep dive, dates
- **Competitive context**: What we overcame (GCP offer, Azure pitch)
- **What's next**: Future plans, next steps with owner and date

**Template** (weave into prose):

```markdown
[H] **Bold Title.** {Account} ({size}, {group}) {what happened with $ impact and YoY%}. {Why it matters: business driver}. {How: SA engagement, dates, people, competitive context if relevant}. [Next Steps: {specific action with owner and date}].
```

### Lowlight Mini-Story Elements

Your narrative should weave together:

- **What happened**: Problem, delay, $ impact, timing miss
- **Why it happened**: Root cause, missed step, external factor
- **How we responded**: Escalation, owner action, recovery plan
- **What we learned**: Process improvement, training need, system change
- **What's next**: Corrective actions with owner and date

**Template** (weave into prose):

```markdown
[L] **Bold Title.** {What happened: problem, account, $ impact}. {Why it happened: root cause}. {How we responded: escalation, actions}. {What we learned: lesson, process change}. [Next Steps: {corrective action with owner and date}].
```

**Important**: Do NOT output numbered sections like "1. What happened:" in the final text. These elements should flow naturally within 3-5 complete sentences.

## Content Requirements

### Must Include Inline
- **Account name** with size band (L/XL/XXL) and group
- **$ amount** (ARR, deal size, revenue impact)
- **YoY growth %** for highlights
- **Specific people** (SA, AM, customer contacts)
- **Dates** (engagement periods, deadlines, events)
- **Technical details** (services, features, architectures)
- **Competitive context** (GCP, Azure, first-party alternatives)
- **Next steps** with owner name and specific date

## Entry Counts

- **Highlights**: 5-8 entries
- **Lowlights**: 3-5 entries

## Critical Rules

### DO:
- Write as 3-5 sentence flowing narrative
- Tell a complete story (what/why/how/next)
- Include competitive context within the narrative
- Name specific people and dates
- Show business impact with $ amounts
- End with concrete next steps

### DO NOT:
- Use bullet points anywhere in Q4
- Use STAR format (Situation:/Task:/Action:/Result:)
- Write compressed one-sentence summaries
- Omit competitive context
- Leave next steps vague
- Forget root cause in lowlights

## Content Scope

**Belongs in Q4 Highlights**:
- Major customer wins with $ impact
- Competitive displacement wins
- Technical achievements with business outcomes
- Strategic partnership announcements
- Design partner relationships
- Conference presentations or case studies

**Belongs in Q4 Lowlights**:
- Deal delays with $ impact
- Customer escalations requiring exec involvement
- Missed opportunities with lessons learned
- Process failures affecting revenue
- Competitive losses with root cause

**Does NOT belong in Q4**:
- Cross-account patterns (those go in Q3)
- Risks still in flight (those go in Q2)
- General observations (those go in Q1)

## Action Tags

### [Next Steps] Format

Use `[Next Steps: specific action with owner name and date]` at the end of each entry to document committed actions:

**Example**: `[Next Steps: Joint PR-FAQ for re:Invent launch, GTM workshop on 4/15 with DataStax GTM lead Sam Chen]`

**Requirements**:
- Owner must be a specific person (not "team" or "group")
- Date must be specific (not "Q2" or "soon")
- Action must be concrete and traceable

## Quality Checks

Before considering Q4 complete, verify:

- [ ] Zero bullet points used
- [ ] All entries are 3-5 sentence mini-stories
- [ ] NO STAR labels used
- [ ] Competitive context included where relevant
- [ ] All entries have $ amounts
- [ ] All entries name specific people
- [ ] All entries have dates and next steps
- [ ] Highlights: 5-8 entries
- [ ] Lowlights: 3-5 entries
- [ ] Root cause included in lowlights
- [ ] All 5 territory groups represented (DASGENAI-WEST-A, DASGENAI-EAST-A, DASGENAI-WEST-B, DASGENAI-GENAI-A, DASGENAI-EAST-B)
- [ ] If group data missing, documented with [DATA NEEDED: {group}]
