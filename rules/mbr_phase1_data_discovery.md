# Phase 1: Data Discovery (Read-Only)

**Part of**: MBR Generation Specification v3.0
**See also**: [CLAUDE.md](../CLAUDE.md) for project setup and MCP tools

## Goal

Gather all required data before writing. This is a read-only phase—no content generation yet.

## Data Collection Steps

### Step 1.1: Collect Business Metrics
- [ ] Revenue vs quota by group (search_opportunities)
- [ ] YTD attainment percentages
- [ ] AI revenue and NNIR data
- [ ] Tech engagement rates (Core and GenAI pipeline)

### Step 1.2: Collect SIFT Insights
- [ ] Search last 30 days by group manager aliases
- [ ] Categorize: [H], [L], [O], [R], [B], [C]
- [ ] Identify cross-account patterns

### Step 1.3: Collect Top Opportunities
- [ ] Pull top 20 by annualized_Revenue__c DESC
- [ ] Ensure all 5 groups represented
- [ ] Get stage, close date, competitor, signal

### Step 1.4: Validate Data Completeness
- [ ] Check all 5 groups have data
- [ ] Mark gaps: [DATA NEEDED: description]
- [ ] Document any API errors or missing sources

## Output

Data inventory with completeness checklist showing:
- Which data sources were successfully queried
- Which groups have complete data
- Any gaps marked with [DATA NEEDED: description]
- Summary counts (opportunities, SIFT insights, territories)

## Next Phase

Proceed to [Phase 2: Content Planning](mbr_phase2_planning.md)
