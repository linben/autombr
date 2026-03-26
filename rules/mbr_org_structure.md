# DAS-GenAI Org Structure

**Part of**: MBR Generation Specification v3.0
**See also**: [CLAUDE.md](../CLAUDE.md) for complete org details

## District Overview

- **District**: DAS-GenAI
- **Total Accounts**: ~308
- **Territory Groups**: 5
- **Territories**: 40 (8 per group)

## Territory Groups

| Group | Filter | Territories |
|-------|--------|-------------|
| DAS-GenAI-West-A | DASGENAI-WEST-A | A-01 through A-08 |
| DAS-GenAI-East-A | DASGENAI-EAST-A | A-01 through A-08 |
| DAS-GenAI-West-B | DASGENAI-WEST-B | B-01 through B-08 |
| DAS-GenAI-GenAI-A | DASGENAI-GENAI-A | A-01 through A-08 |
| DAS-GenAI-East-B | DASGENAI-EAST-B | B-01 through B-08 |

## Group Managers

**West-A**: Christian Conway (conwachr)
**East-A**: Heather Devore (hdevore)
**West-B**: Vanja Artis (artisvan) / Carol Potts (capotts)
**GenAI-A**: Max Tynan (maxtynan) / Jillian D'arcy (jdarcy)
**East-B**: Aarti Comstock (acomstoc) / Andy Perkins (perkiand)

**District Manager**: Vinay Krishna (vinokri) - for cross-group insights

## Account Size Bands

- **L** (Large): $100K - $1M ARR
- **XL** (Extra Large): $1M - $5M ARR
- **XXL** (Enterprise): $5M+ ARR

## Usage in MBR

### When Referencing Accounts

Always include:
1. Account name
2. Size band (L/XL/XXL)
3. Group assignment

**Example**: "DataStax (XXL, DASGENAI-WEST-A)"

### When Collecting Data

Use group filters for MCP queries:
- Salesforce: `ownershipFilter` by group manager alias
- SIFT: `createdBy` filter with manager aliases
- Territories: `territoryGroup` filter with DASGENAI-* codes

### All 5 Groups Rule

**Every section must include data from all 5 groups:**
- Q1: Business metrics and observations from all groups
- Q2: Risks/blockers covering all groups
- Q3: Cross-group initiatives (by definition)
- Q4: Highlights/lowlights from all groups
- Appendix F: Top 20 with all groups represented
- Appendix G: Explicit group summary table

If a group has no data: Mark [DATA NEEDED: group name]
