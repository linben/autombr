# MBR Document Structure

**Part of**: MBR Generation Specification v3.0

## Page 1: 2x2 Grid

**Format**: Landscape, Calibri 9pt

```
┌────────────────────────────────┬──┬───────────────────────────┐
│ Q1: Health of Business &       │  │ Q2: Observations,         │
│     Top Business Observations  │  │     Challenges, Risks &   │
│     (NARRATIVE PARAGRAPH)      │  │     Blockers              │
│                                │  │     (INLINE [TAG] PROSE)  │
├────────────────────────────────┼──┼───────────────────────────┤
│ Q3: #OneTeam Tech Initiatives  │  │ Q4: Customer Highlights & │
│     (SIFT-SOURCED ONLY)        │  │     Lowlights             │
│                                │  │     (NARRATIVE MINI-STORY)│
└────────────────────────────────┴──┴───────────────────────────┘
```

### Quadrant Guidelines

**Q1 (Top Left)**: Health of Business
- Single narrative paragraph for metrics
- 3-5 narrative paragraphs for observations
- NO bullet points

**Q2 (Top Right)**: Risks/Blockers
- 4-6 [TAG] entries
- Inline prose format
- Priority order: [R] → [B] → [C] → [O]

**Q3 (Bottom Left)**: #OneTeam Initiatives
- SIFT-sourced cross-account patterns only
- SA engagement documented
- Or placeholder if none found

**Q4 (Bottom Right)**: Highlights/Lowlights
- 5-8 [H] highlights
- 3-5 [L] lowlights
- 3-5 sentence mini-stories
- NO bullet points

## Appendices

### Appendix A: YTD Net Usage by Group
- **Chart**: Bar or line chart
- **Data**: Monthly usage by group
- **Y-axis**: $ spent or usage units
- **X-axis**: Months (YTD)
- **Series**: One per group (5 total)

**Additional**: Top 20 Accounts chart
- Horizontal bar chart
- Sorted by spend DESC

### Appendix B: GenAI / Bedrock Adoption
- **Chart**: Adoption metrics
- **Metrics**: Bedrock API calls, unique accounts, service breakdown
- **Trend**: Month-over-month growth

### Appendix C: Pipeline vs Spend by Group
- **Chart**: Scatter or grouped bar
- **X-axis**: Current spend
- **Y-axis**: Pipeline (opportunities)
- **Points/Bars**: One per group
- **Purpose**: Show pipeline health relative to current revenue

### Appendix D: Utility Launched Timeline
- **Chart**: Gantt or timeline
- **Items**: Major launches, milestones
- **Dates**: Launch dates for new services/features

**Additional**: Stalled Pipeline chart
- Opportunities not progressing
- By stage and group

### Appendix F: Top 20 Opportunities by ARR
- **Format**: Table
- **Columns**: Account | Group | Stage | ARR | Close Date | Competitor | Signal
- **Rows**: Exactly 20 (from all 5 groups)
- **Sort**: ARR descending

**MUST HAVE 20 ENTRIES**

### Appendix G: Territory Group Summary
- **Format**: Table
- **Columns**: Group | Territories | Accounts | ARR | YoY % | Pipeline | Tech Eng %
- **Rows**: All 5 groups
- **Purpose**: Group-level scorecard

## File Naming

**Format**: `MBR_DAS-GenAI_[YYYY-MM].md`

**Examples**:
- `outputs/MBR_DAS-GenAI_2026-03.md`
- `MBR_DAS-GenAI_2026-04.md`

## Document Length

**Target**: 2-3 pages at Calibri 9pt (landscape)
- Page 1: 2x2 grid (1 page)
- Appendices: 1-2 pages

**If longer**: Tighten narrative, reduce redundancy
**If shorter**: Expand observations and examples
