# claude-skills

Personal library of Claude Code skills. All skills live in `.claude/skills/<name>/` and are picked up automatically by any Claude Code session that has this repo checked out.

## Use the skills in another project

Copy the skill folders you need into that project's `.claude/skills/`, or into `~/.claude/skills/` to make them available in every project.

## Skills

### Productivity

| Skill | Purpose | Source |
| --- | --- | --- |
| `ainote` | Operate AINOTE notes, folders, schedules, reminders and todos through the local AINOTE desktop app. Requires the app installed and signed in, plus Python 3.8+. | [iflyink/ainote](https://github.com/iflyink/ainote) (MIT) |
| `caveman` | Terse, no-filler output mode. Invoke with `/caveman`. | [Shawnchee/caveman-skill](https://github.com/Shawnchee/caveman-skill) @ `82af154` (MIT) |

### Marketing (50)

Source: [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) @ `dda3841` (MIT). Its `tools/clis` folder (third-party API wrappers that need keys) is not included.

Run `product-marketing` first. It writes `.agents/product-marketing.md`, a context file the other skills read.

| Area | Skills |
| --- | --- |
| Strategy & planning | `product-marketing`, `marketing-plan`, `marketing-ideas`, `marketing-council`, `marketing-loops`, `marketing-psychology`, `content-strategy` |
| Offers & pricing | `offers`, `pricing`, `paywalls` |
| Copy | `copywriting`, `copy-editing`, `emails`, `cold-email`, `sms`, `popups` |
| Sales & outbound | `prospecting`, `sales-enablement`, `revops`, `customer-research` |
| Events, partners & PR | `events`, `co-marketing`, `community-marketing`, `influencer-marketing`, `public-relations`, `referrals`, `launch` |
| Paid & creative | `ads`, `ad-creative`, `image`, `video`, `social` |
| SEO | `seo-audit`, `ai-seo`, `programmatic-seo`, `schema`, `site-architecture`, `directory-submissions` |
| Competitors | `competitors`, `competitor-profiling` |
| Conversion & measurement | `cro`, `signup`, `onboarding`, `churn-prevention`, `ab-testing`, `analytics`, `attribution` |
| Lead generation & apps | `lead-magnets`, `free-tools`, `aso` |

## Updating a skill

Re-copy the skill folder from its source repo and note the new commit in the table above.
