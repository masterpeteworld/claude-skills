---
name: meeting-assistant
description: Turn meeting transcripts or raw notes into chronological minutes with confirmed decisions, pending items, disagreements, and an owner/deadline action table.
---
> Source: https://github.com/aipoch/medical-research-skills (scientific-skills/Other/meeting-assistant), MIT, AIPOCH. Trimmed for general use.

# Meeting Assistant

## When to Use
1. Meeting minutes from raw notes or transcripts, with a clear timeline of what was discussed.
2. Action item tracking after recurring meetings (weekly syncs, standups, steering committees, client/partner calls) where owners and deadlines must be captured.
3. Cross-team project sync: consolidate decisions, disagreements, and follow-ups into one output.
4. Decision logging where confirmed decisions must be separated from items still pending confirmation.
5. Post-meeting follow-up prep: concise next steps and unresolved questions.

## Workflow
1. **Normalize input** - prefer timestamps and speaker labels; if missing, infer order from paragraphs and explicit time cues.
2. **Timeline** - sort entries by timestamp (or inferred order); write a concise chronological summary that keeps key context.
3. **Extract**
   - Decisions: statements of approval, confirmation, or commitment.
   - Pending: proposals, open questions, "to be confirmed" items.
   - Disagreements: explicit objections, conflicting views, unresolved trade-offs.
   - Action items: task + owner + deadline (+ optional status).
4. **Structure output** in this fixed order: Basic Info -> Timeline Summary -> Decisions (Confirmed) -> Items Pending Confirmation -> Disagreements / Open Issues -> Action Items table.

## Output Rules
- Timeline follows meeting order.
- Never mix confirmed decisions with pending items.
- Every action item has an Owner (use `Unassigned` if unknown) and a Deadline (use `TBD` if unknown).
- Use only content from the provided material. No invented facts, owners, or dates.
- Preserve numbers, dates, and commitments exactly.
- Mask emails and phone numbers in the output unless the user asks to keep them.
- If inputs are missing or unreadable, say exactly what is missing and stop.

## Output Template
```markdown
# Meeting Minutes

## Basic Information
- Meeting Subject:
- Date:
- Participants:
- Recorder:

## Timeline Summary (Chronological)
1. [time] ...

## Decisions (Confirmed)
1. ...

## Items Pending Confirmation
1. ...

## Disagreements / Open Issues
- ...

## Action Items
| Task | Owner | Deadline | Status |
|------|-------|----------|--------|
```

End with a one-line note of any assumptions made (e.g., inferred order, missing deadlines marked TBD).
