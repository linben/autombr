# autombr Project Guidelines

## Project Overview

**Purpose**: Generate Monthly Business Reviews (MBRs) for the AWS DAS-GenAI district.

**Architecture**: Single MBR Generator Agent
- Fetches data from Salesforce and SIFT via MCP tools
- Produces executive-ready 2x2 format MBR documents
- Follows phased execution: Data Discovery → Planning → Writing → Validation

**Development Approach**: Specification-driven development
- Agent follows detailed operational specifications in modular format
- Specifications define role, workflow, format rules, and quality gates
- Examples demonstrate good and bad patterns

## Technical Architecture

### Agent Framework
- **Language**: Python 3.10+
- **Framework**: strands-agents >= 1.6.0
- **LLM**: AWS Bedrock (Claude models via us.anthropic.claude-3-5-sonnet-20241022-v2:0)
- **MCP Integration**: aws-sentral-mcp server for data access

### Key Dependencies
```
strands-agents>=1.6.0        # Agent framework
mcp>=0.1.0                   # Model Context Protocol
boto3>=1.34.0                # AWS SDK for Bedrock
python-dotenv>=1.0.0         # Environment configuration
```

## MCP Server Configuration

### Server: aws-sentral-mcp

**Connection Type**: stdio (command-line process)

**Configuration** (see `.mcp.json`):
```json
{
  "mcpServers": {
    "aws-sentral-mcp": {
      "command": "aws-sentral-mcp",
      "args": []
    }
  }
}
```

**Connection Pattern**:
```python
from mcp.client.stdio import stdio_client
from strands.tools.mcp import MCPClient

transport = lambda: stdio_client(command="aws-sentral-mcp", args=[])
mcp_client = MCPClient(transport)
mcp_client.start()
available_tools = mcp_client.list_tools_sync()
```

## Data Sources

### Salesforce Data (via MCP)

**Available Tools**:
- `search_opportunities` - Query opportunities with filters
  - Filter by ownershipFilter (group managers)
  - Sort by annualized_Revenue__c DESC
  - Returns: accountName, stage, ARR, closeDate, competitors
- `get_account_spend_summary` - Account spend totals
  - Returns: totalSpend, YoYGrowth
- `get_account_spend_by_service` - Service-level spend breakdown
  - Returns: serviceName, spend, YoYGrowth
- `list_territories` - Territory assignments
  - Filter by territory group
  - Returns: territoryName, ownerAlias, accountCount

**Data Categories**:
- Opportunities: Pipeline, stage, ARR, close dates
- Spend: Account totals, service breakdowns, YoY growth
- Territories: Assignments, account counts per group

### SIFT Insights (via MCP)

**Available Tools**:
- `sift_insights_search` - Search with filters and date ranges
  - dateRangeStart, dateRangeEnd (ISO 8601 format)
  - createdBy (group manager aliases)
  - category (H/L/O/R/B/C)
  - Returns: title, description, category, createdAt, createdBy
- `sift_insights_listMyInsights` - List current user's insights
- `sift_insights_fetchById` - Get full insight details by ID

**SIFT Categories**:
- **[H]** Highlight - Wins, successes, positive outcomes
- **[L]** Lowlight - Setbacks, challenges, lessons learned
- **[O]** Observation - Patterns, trends, field intelligence
- **[R]** Risk - Potential problems, revenue at risk
- **[B]** Blocker - Critical impediments requiring action
- **[C]** Challenge/Competitive - Market dynamics, competitor activity

**Date Range**: Typically last 30 days from current date

### Fixed Reference Data

**DAS-GenAI Org Structure**:
- **Total Accounts**: ~308
- **Territory Groups**: 5
- **Territories**: 40 (8 per group)

**Groups and Filters**:
| Group | Filter | Territories |
|-------|--------|-------------|
| DAS-GenAI-West-A | DASGENAI-WEST-A | A-01 through A-08 |
| DAS-GenAI-East-A | DASGENAI-EAST-A | A-01 through A-08 |
| DAS-GenAI-West-B | DASGENAI-WEST-B | B-01 through B-08 |
| DAS-GenAI-GenAI-A | DASGENAI-GENAI-A | A-01 through A-08 |
| DAS-GenAI-East-B | DASGENAI-EAST-B | B-01 through B-08 |

**Group Managers** (SIFT creators):
- West-A: Christian Conway (conwachr)
- East-A: Heather Devore (hdevore)
- West-B: Vanja Artis (artisvan) / Carol Potts (capotts)
- GenAI-A: Max Tynan (maxtynan) / Jillian D'arcy (jdarcy)
- East-B: Aarti Comstock (acomstoc) / Andy Perkins (perkiand)
- District Manager: Vinay Krishna (vinokri) - cross-group insights

**Account Size Bands**:
- **L** (Large): $100K - $1M ARR
- **XL** (Extra Large): $1M - $5M ARR
- **XXL** (Enterprise): $5M+ ARR

## Project Structure

### Specification Files

**[mbr-critique-agent-prompt.md](mbr-critique-agent-prompt.md)** - QA Validation
- Quality assurance rules for MBR output
- Validates format compliance and content standards
- Used to review generated MBRs before submission

**[MBR_DAS-GenAI_2026-03.md](MBR_DAS-GenAI_2026-03.md)** - Example Output
- Complete MBR from March 2026
- Shows expected format and content quality
- Reference for what good output looks like

### Modular Rule Files

**Phase Rules** (`rules/mbr_phase*.md`):
- Phase 1: Data Discovery - Data collection checklists
- Phase 2: Planning - Content outline workflow
- Phase 3: Writing - Narrative generation process
- Phase 4: Validation - Quality verification gates

**Format Rules** (`rules/mbr_format_q*.md`):
- Q1: Health of Business - Narrative paragraph format
- Q2: Risks/Blockers - [TAG] inline prose format
- Q3: #OneTeam - SIFT-sourced initiatives format
- Q4: Highlights/Lowlights - Mini-story format

**Supporting Documentation** (`rules/mbr_*.md`):
- Data Sources - Field definitions and MCP tool usage
- Error Handling - Patterns for missing/ambiguous data
- Org Structure - DAS-GenAI groups and territories
- Document Structure - 2x2 grid and appendices

**Examples** (`examples/mbr_examples_q*.md`):
- Good and bad examples for each quadrant
- "Why BAD" explanations for anti-patterns
- Demonstrates specific numbers, names, dates, accountability

## Development Workflow

### 1. Understand the Spec
- Read CLAUDE.md (this file) for project context
- Read relevant rules from [rules/](rules/) and [examples/](examples/) directories
- Review phase workflows: Data Discovery → Planning → Writing → Validation

### 2. Implement Agent
- Follow phased execution pattern (Discovery → Planning → Writing → Validation)
- Use MCP tools to fetch real data (never fabricate)
- Apply format rules for output generation
- Learn from good/bad examples

### 3. Test with MCP Tools
- Connect to aws-sentral-mcp server
- Verify tool availability (list_tools_sync)
- Test data fetching with date filters
- Validate data completeness

### 4. Validate Output
- Run through critique agent prompt
- Check all quality gates pass
- Verify format compliance (no bullets in Q1/Q4, [TAG] format in Q2, etc.)
- Ensure all 5 groups represented

### 5. Iterate
- Fix validation failures
- Update content based on feedback
- Re-run quality checks
- Document any spec clarifications needed

## Error Handling Patterns

### Missing Data
- **Salesforce returns no data**: Mark `[DATA NEEDED: Salesforce opportunities for DASGENAI-WEST-A]`
- **SIFT returns no insights**: Note "No SIFT insights found for [group] in last 30 days"
- **Fewer than expected records**: Include all available, note count discrepancy
- **Never fabricate or estimate numbers**

### Ambiguous Data
- **Unclear stage**: Use Stage field as-is, mark `[Stage Unknown]` if missing
- **Missing size band**: Estimate from spend tiers, mark `(Size estimated from spend)`
- **Unnamed competitor**: Only include if explicitly documented in Opportunity

### API Failures
- **Connection timeout**: Log error, continue with cached/available data
- **Rate limiting**: Implement exponential backoff, retry with delay
- **Authentication error**: Check AWS credentials, MCP server configuration
- **Document gaps**: Always mark `[DATA NEEDED: description]` for missing sources

### Rule Conflicts
**Priority Order**:
1. SIFT categorization takes precedence ([H] → Q4, [R] → Q2)
2. Account-level observations can appear in both Q1 AND Q4
3. Cross-account patterns are Q3 if SIFT-sourced, otherwise Q1

**Validation Failures**:
- Stop immediately, don't proceed to output
- Report specific failure: "Q1 contains bullets (format violation)"
- Request correction or rule clarification

## Amazon Writing Standards

### Working Backwards
- Start with customer outcome (what does the reader need?)
- Define success criteria before execution
- Every section should enable decision-making

### Be Specific
- Use concrete data, not generalities
- Name accounts, people, dates, amounts
- Avoid vague language ("good", "many", "soon")

### Use Data
- All claims backed by Salesforce/SIFT metrics
- Include YoY growth percentages
- Show ARR and spend figures inline
- Reference specific stage, close date, pipeline

### Narrative Structure
- Tell a coherent story, not just facts
- Flow from metrics → observations → actions
- Connect cause and effect
- Show patterns across accounts

### Leadership Principles
- **Bias for Action**: Include `[Next Steps]` with owner and date
- **Ownership**: Name specific people responsible
- **Deliver Results**: Track against quota, forecast, YTD

### Clear Accountability
- Every risk has named owner
- Every action has specific date
- Next steps are concrete and measurable
- Follow-up is traceable

## Quality Standards

### Format Compliance
- Q1: Narrative paragraphs, NO bullets
- Q2: [TAG] Bold Title. Inline prose. [Next Steps]. NO STAR format
- Q3: SIFT-sourced only, SA engagement documented
- Q4: 3-5 sentence mini-stories, NO bullets

### Data Completeness
- All 5 groups represented in every quadrant
- Top 20 opportunities has exactly 20 entries
- All numbers from Salesforce (not estimated)
- SIFTs from last 30 days with named creators

### Content Quality
- Specific accounts named with size bands
- Dollar amounts and YoY percentages inline
- Competitive context where applicable
- Clear next steps with owner and date

## Getting Help

### Documentation
- Review this CLAUDE.md for project setup
- Check rules/ directory for MBR generation rules (phases, formats, data sources)
- Read examples/ directory for good/bad patterns
- Review mbr-critique-agent-prompt.md for QA validation rules

### Troubleshooting
- MCP connection issues: Check .mcp.json configuration
- Data gaps: Review error handling patterns above
- Format violations: Compare against examples/
- Validation failures: Run mbr-critique-agent-prompt.md

### Specification Updates
- If a rule is unclear, document the ambiguity
- Propose clarification with example
- Update relevant rule file (not CLAUDE.md)
- Test with existing examples to verify fix
