# Q1: Health of Business - Examples

**Part of**: MBR Generation Specification v3.0
**See also**: [Q1 Format Rules](../rules/mbr_format_q1.md)

## GOOD Example

"The DAS-GenAI district delivered $47.2M in NNIR for March, achieving 103% of the $45.8M quota and representing 18% YoY growth. Top three NNIR drivers were: DataStax ($8.4M, 42% YoY), MongoDB ($6.1M, 15% YoY), and Databricks ($5.9M, 38% YoY). AI-specific revenue reached $12.3M against a $10.5M quota (117% attainment), with top AI drivers being Writer AI ($2.1M), Grammarly ($1.8M), and Snorkel AI ($1.4M). April forecast projects $49.1M based on current Stage 3+ pipeline. YTD position is 105% to goal at $138.7M of $132M target. Tech engagement rate for Core pipeline is 78% and GenAI pipeline is 92%.

Pattern: Multi-cloud data platforms consolidating to AWS. DataStax (XXL, DASGENAI-WEST-A) migrated $3.2M ARR from GCP to AWS S3 Tables, citing 40% cost reduction and simplified architecture. MongoDB (XXL, DASGENAI-EAST-A) expanded $2.1M ARR for Atlas on AWS with DocumentDB integration. CockroachDB (XL, DASGENAI-GENAI-A) added $1.4M ARR for serverless workloads. [Ask: Service team support for S3 Tables ISV integration patterns]."

### Why GOOD

✅ **Single flowing paragraph** for metrics (not bullets)
✅ **Specific numbers**: $47.2M, 103%, 18% YoY, etc.
✅ **Top 3 drivers named** with $ amounts and YoY %
✅ **AI revenue called out** separately with specific numbers
✅ **Forecast and YTD** included with concrete figures
✅ **Tech engagement rates** for both Core and GenAI

✅ **Observation as narrative paragraph** (3-5 lines)
✅ **Pattern headline** clearly stated
✅ **Accounts named** with size bands (XXL, XL)
✅ **Groups identified** (DASGENAI-WEST-A, DASGENAI-EAST-A, etc.)
✅ **$ ARR inline** for each account
✅ **[Ask]** included for actionable follow-up

## BAD Example (avoid this)

"Revenue was good this month. We hit our numbers. Top accounts performed well. ISVs are interested in GenAI. Several customers expanded their AWS usage. We have a healthy pipeline for next month. Tech engagement is strong."

### Why BAD

❌ **Generic language**: "good", "several", "strong" (not specific)
❌ **No numbers**: No $ amounts, no percentages, no quotas
❌ **No account names**: Says "top accounts" but doesn't name them
❌ **No size bands**: Doesn't indicate L/XL/XXL
❌ **No groups**: Doesn't reference DASGENAI-* groups
❌ **No YoY growth**: Missing comparative metrics
❌ **No actionability**: No [Ask], no specific patterns
❌ **Vague observations**: "interested in GenAI" tells us nothing
❌ **No concrete data**: Could be copy-pasted from any month

## What Makes Q1 Examples Work

### Metrics Paragraph Must Have
- Specific $ revenue vs specific $ quota
- Attainment % (e.g., 103%)
- YoY growth %
- Top 3 drivers with $ and YoY
- AI-specific revenue breakdown
- Next month forecast
- YTD position
- Tech engagement rates

### Observation Paragraphs Must Have
- Clear pattern statement
- 3+ named accounts
- Size bands (L/XL/XXL)
- Group assignments (DASGENAI-*)
- $ ARR for each account
- Specific technical details
- [Ask] for action items

### Common Mistakes to Avoid
- Using bullet points (Q1 must be prose)
- Generic preambles repeated monthly
- Vague language without numbers
- Accounts without size bands
- Observations without $ impact
- Missing group representation
