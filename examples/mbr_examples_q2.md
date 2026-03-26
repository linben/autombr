# Q2: Risks/Blockers - Examples

**Part of**: MBR Generation Specification v3.0
**See also**: [Q2 Format Rules](../rules/mbr_format_q2.md)

## GOOD Example

"[R] Grammarly $10M Bedrock CMI Capacity Risk. Grammarly's production workload requires 200K RPS for Meta Llama 3.2 3B to support their 30M daily active users. Current capacity of 20K RPS (10%) is insufficient for full launch planned July 15. SA Mike Chen is on daily stand-ups with Bedrock service team and Grammarly VP Engineering Sarah Kim. Interim milestone of 20K RPS achieved August 4th. [Next Steps: Gradual increase to 100% capacity by July 1st, escalated to Bedrock GM Mark Johnson with Matador tracking]."

### Why GOOD

✅ **[R] tag** used correctly
✅ **Bold title** with $ impact ($10M)
✅ **Inline prose** - flows like a story
✅ **Specific numbers**: 200K RPS needed, 20K current, 10% progress
✅ **Account named** (Grammarly)
✅ **People named**: SA Mike Chen, Sarah Kim (VP Eng), Mark Johnson (Bedrock GM)
✅ **Dates included**: July 15 launch, August 4th milestone, July 1st target
✅ **Current status**: 20K RPS achieved (interim milestone)
✅ **Context**: 30M daily active users (why this matters)
✅ **[Next Steps]** with specific owner and date
✅ **Escalation path**: Matador tracking to Bedrock GM

## BAD Example (avoid this)

"**Risk:** Capacity issues. **Situation:** Customer needs more capacity. **Task:** Working with service team. **Action:** Daily meetings. **Result:** Making progress."

### Why BAD

❌ **STAR format** used (Situation:/Task:/Action:/Result:)
❌ **No account name** (which customer?)
❌ **No $ amount** (what's at risk?)
❌ **No specific people** (who is "service team"?)
❌ **No dates** (when is capacity needed?)
❌ **Vague language**: "capacity issues", "making progress"
❌ **No numbers**: How much capacity? What's current state?
❌ **No next steps** with owner/date
❌ **Not narrative**: Choppy labels instead of flowing story

## What Makes Q2 Examples Work

### Entry Must Have
- [TAG] at start ([R], [B], [C], or [O])
- Bold title with $ impact
- Account name (with size band ideally)
- Specific $ amount at risk or affected
- Named people (SA, customer contacts, service team members)
- Tools and systems mentioned
- Dates (deadlines, milestones, next actions)
- Current status (%, progress indicators)
- [Next Steps:] with owner name and specific date

### Narrative Flow
1. **Open with the risk** and $ impact
2. **Explain why it matters** (user base, deadline, business context)
3. **Show current state** (capacity %, progress achieved)
4. **Name who's working on it** (SA, AM, service team)
5. **End with next steps** (owner, date, escalation)

### Common Mistakes to Avoid
- Using STAR format (Situation:/Task:/Action:/Result:)
- Bullet points or nested structure
- Assuming risks without SIFT/Salesforce evidence
- Vague next steps ("monitoring", "working on it")
- Exceeding 4-6 total entries
- Creating separate entries for related issues (group them)
- Missing $ impact or people names
