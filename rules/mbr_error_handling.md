# MBR Error Handling Patterns

**Part of**: MBR Generation Specification v3.0
**See also**: [CLAUDE.md](../CLAUDE.md) for general error handling

## When Data Is Missing

### Salesforce API Returns No Data

**Action**:
- Mark section: [DATA NEEDED: Salesforce opportunities for DASGENAI-WEST-A]
- Continue with available data from other groups
- Do NOT fabricate or estimate numbers

**Example**:
```
Q1 Business Metrics: [DATA NEEDED: Salesforce opportunities for DASGENAI-WEST-A]
Proceeding with data from 4 of 5 groups...
```

### SIFT Search Returns No Insights for a Group

**Action**:
- Note: "No SIFT insights found for [group] in last 30 days"
- Check if date range or filter is too narrow
- Use prior month data with disclaimer: "(Data from February 2026)"

**Example**:
```
No SIFT insights found for DASGENAI-WEST-B in last 30 days. Review shows
this group had 12 insights in February 2026 (prior month), suggesting
potential submission gap.
```

### Top 20 Has Fewer Than 20 Opportunities

**Action**:
- Include all available opportunities
- Note: "Top [N] Opportunities (20 requested, [N] found)"
- Add explanation: "Lower pipeline due to quarter-end close"

**Example**:
```
## Appendix F: Top 15 Opportunities by ARR
(20 requested, 15 found - lower pipeline due to Q1 quarter-end close)
```

## When Data Is Ambiguous

### Opportunity Stage Is Unclear

**Action**:
- Use Stage field from Salesforce as-is, don't interpret
- If missing: "[Stage Unknown]"

**Example**:
```
DataStax Migration ($8.4M ARR, [Stage Unknown], Close: Q2 2026)
```

### Account Size Band Not in Salesforce

**Action**:
- Use spend tiers: >$5M=XXL, $1-5M=XL, $100K-1M=L
- Mark: "(Size estimated from spend)"

**Example**:
```
CockroachDB (XL, size estimated from spend)
```

### Competitor Not Explicitly Named

**Action**:
- Don't assume competitive context
- Only include competitor if explicitly documented in Opportunity

**Example**:
```
✓ GOOD: "Competitive pressure from GCP with $2M incentive offer"
✗ BAD:  "Likely competitive with GCP" (assumption, not documented)
```

## When Rules Conflict

### Priority Order for Content Placement

1. **SIFT categorization takes precedence**
   - [H] goes to Q4 Highlights
   - [R] goes to Q2 Risks
   - [L] goes to Q4 Lowlights
   - [O] can go to Q1 or Q2 depending on context

2. **Account-level observations can appear in Q1 AND Q4**
   - Q1: Pattern observation across multiple accounts
   - Q4: Specific win story with full narrative

3. **Cross-account patterns**
   - Q3 if SIFT-sourced with SA engagement
   - Q1 if observation without SA initiative documentation

### When Validation Fails

**Action**:
- Stop immediately
- Report specific failure: "Q1 contains bullets (Rule 1 violated)"
- Do NOT proceed to output
- Request correction or rule clarification

**Example**:
```
VALIDATION FAILED:
- Q1: Contains 5 bullet points (Rule: must be narrative paragraphs)
- Q2: Entry #3 missing [Next Steps] (Rule: all entries must have next steps)
- Q4: Only 3 highlights found (Rule: 5-8 highlights required)

Stopping. Fix violations before resubmission.
```

## Error Recovery Patterns

### API Timeout or Rate Limiting
- Implement exponential backoff
- Retry with delay (1s, 2s, 4s, 8s)
- Log error and continue with cached data if retries fail

### Authentication Error
- Check AWS credentials
- Verify MCP server configuration
- Document gap: [DATA NEEDED: authentication issue]

### Partial Data Success
- Use what you have
- Document gaps clearly
- Proceed with warning about incompleteness

## Never Do

- ❌ Fabricate numbers or estimates
- ❌ Assume competitive context without evidence
- ❌ Proceed with validation failures
- ❌ Silently skip missing groups
- ❌ Interpret ambiguous data without marking uncertainty
