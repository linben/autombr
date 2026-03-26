# MBR Data Sources

**Part of**: MBR Generation Specification v3.0
**See also**: [CLAUDE.md](../CLAUDE.md) for MCP setup details

## Data Sourcing Rules

### RULE 1: ALL 5 GROUPS MUST BE REPRESENTED

Every quadrant and appendix must include data from all 5 groups:
- DAS-GenAI-West-A (DASGENAI-WEST-A, A-01 through A-08)
- DAS-GenAI-East-A (DASGENAI-EAST-A, A-01 through A-08)
- DAS-GenAI-West-B (DASGENAI-WEST-B, B-01 through B-08)
- DAS-GenAI-GenAI-A (DASGENAI-GENAI-A, A-01 through A-08)
- DAS-GenAI-East-B (DASGENAI-EAST-B, B-01 through B-08)

If a group has no data for a section, mark [DATA NEEDED: group]

### RULE 2: TOP 20 OPPS MUST HAVE 20 ENTRIES

- Pull from all 5 group managers via search_opportunities
- Sort by annualized_Revenue__c DESC
- Include: Account, Group, Stage, ARR, Close Date, Competitor, Signal
- All 5 groups must appear in the table

### RULE 3: NUMBERS FROM SALESFORCE ONLY

- Spend: get_account_spend_summary, get_account_spend_by_service
- Opps: search_opportunities with ownershipFilter per group manager
- SIFTs: sift_insights_search or sift_insights_listMyInsights
- Territories: list_territories per group filter
- **Never fabricate numbers**. Use [DATA NEEDED: description] for gaps.

### RULE 4: SIFT DATA SOURCING (CRITICAL)

**ALWAYS search BOTH AM aliases AND SA aliases for every group.**
Missing either will result in incomplete coverage.

#### Why Comprehensive Coverage Matters

- Q4 (SA-led highlights/lowlights) requires SA-authored SIFTs
- Q1/Q2 (business observations, risks) require AM-authored SIFTs
- Searching only managers (~10 aliases) misses 60+ SA/AM contributors
- Result: incomplete Q4 content, missing SA technical wins

#### Batch Search Strategy

Execute searches in 10 batches to ensure MCP tool performance:

**Batch 1 - Choksi SAs (10 aliases)**:

- sharmajt, vinokri, twaman, dantrard, sjjambun, nwadhera, prernami, linbenj, irdoshi, sparkcon

**Batch 2 - Pierce SAs (9 aliases)**:

- pkthati, panasewi, dfrizner, vindah, glovlato, yerkolas, kulneel, kevinvt, aberagh

**Batch 3 - Ravula SAs (7 aliases)**:

- euckew, haoxil, malinich, amythili, weinsran, micbert, sankampa

**Batch 4 - IC SAs (5 aliases)**:

- vppwr, bniu, pablito, mankhanu, spalakod

**Batch 5 - West-A AMs (8 aliases)**:

- pmoazeni, dinkle, jotimmes, mihelich, marweav, brannaus, setbrook, jrdnc

**Batch 6 - East-A AMs (8 aliases)**:

- rpisapat, gregfoss, joshkeri, kjepeter, kmc, ckdaley, nessjuli, lzahav

**Batch 7 - West-B AMs (7 aliases)**:

- theisenh, kandrso, bkammere, lucadoan, mmilloy, tobinjos, ahmshawn

**Batch 8 - GenAI-A AMs (7 aliases)**:

- mckellen, bswalsh, msulman, golestan, natesund, mathcyri, michsole

**Batch 9 - East-B AMs (8 aliases)**:

- slgreen, noaoron, dihoover, rynolfr, bbbicket, aggivehc, dpericks, tonryan

**Batch 10 - Group Managers (8 aliases)**:

- conwachr, hdevore, artisvan, capotts, jdarcy, maxtynan, acomstoc, perkiand

**Total Coverage**: ~70 aliases across SA teams, AM teams, and managers

#### Search Parameters

- dateRangeStart: (today - 30 days)
- dateRangeEnd: today
- createdBy: [batch_aliases]
- Fields: title, description, category, createdAt, createdBy

#### Categorization

- H (Highlight) - Wins, successes, positive outcomes
- L (Lowlight) - Setbacks, challenges, lessons learned
- O (Observation) - Patterns, trends, field intelligence
- R (Risk) - Potential problems, revenue at risk
- B (Blocker) - Critical impediments requiring action
- C (Competitive/Challenge) - Market dynamics, competitor activity

## Required Inputs

### From Salesforce (via MCP)

**search_opportunities**:
- Filter by ownershipFilter for each group manager
- Fields: accountName, stage, annualized_Revenue__c, closeDate, competitors__c
- Sort: annualized_Revenue__c DESC
- Limit: 100 per group

**get_account_spend_summary**:
- For each account in opportunities
- Fields: totalSpend, YoYGrowth

**get_account_spend_by_service**:
- For AI revenue breakdown
- Fields: serviceName, spend, YoYGrowth

**list_territories**:
- Filter by territory group
- Fields: territoryName, ownerAlias, accountCount

### From SIFT (via MCP)

**sift_insights_search**:

**CRITICAL**: Execute batch search strategy from Rule 4 above. Search ALL 10 batches covering ~70 aliases.

For each batch, execute:

```python
sift_insights_search(
  dateRangeStart: (today - 30 days),
  dateRangeEnd: today,
  createdBy: [batch_aliases]
)
```

- Returns: title, description, category, createdAt, createdBy
- Aggregate results across all 10 batches
- Categorize by SIFT type: [H], [L], [O], [R], [B], [C]

### Fixed Reference Data

- Org structure (5 groups, 40 territories, manager aliases)
- Group filters: DASGENAI-WEST-A, DASGENAI-EAST-A, etc.
- Size bands: L ($100K-1M), XL ($1-5M), XXL (>$5M)

## Expected Outputs

### Primary Output: 2x2 MBR Document
- Format: Markdown
- Structure: 4 quadrants + 6 appendices
- Length: ~2-3 pages at Calibri 9pt
- Filename: `MBR_DAS-GenAI_[YYYY-MM].md`

### Secondary Outputs
- Data completeness report (which groups/sources had gaps)
- Validation report (which quality checks passed/failed)
- SIFT categorization summary (count by [H]/[L]/[R]/[B]/[C]/[O])

### Quality Gates
- All outputs must pass validation checklist
- If validation fails, report failure and stop
- Do NOT output incomplete or non-compliant MBR
