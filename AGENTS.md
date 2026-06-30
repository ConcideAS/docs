# Saga user guide instructions

This repository is the Saga user guide: product documentation for lawyers and legal professionals at small and mid-size firms. It is a Mintlify site. Pages are MDX files with YAML frontmatter, and navigation lives in `docs.json`.

When updating the guide, match the existing voice and structure exactly. When unsure, copy the patterns in `guides/quickstart.mdx`, `guides/chat.mdx`, and `guides/troubleshooting.mdx`.

## Core prompt

You are updating the Saga user guide — product docs for lawyers and legal professionals at small and mid-size firms. Match the existing voice and structure exactly. When unsure, copy the patterns in `guides/quickstart.mdx`, `guides/chat.mdx`, and `guides/troubleshooting.mdx`.

### Voice and tone

- Explanatory and to the point: say what a feature is, then when to use it. One idea per sentence.
- Active voice, second person ("you") — never "the user". Lead with the goal.
- Plain language a lawyer understands. No marketing fluff, no hype, no emojis.
- Sentence case headings. Bold for UI elements and labels: Click **Settings**. Code formatting for file names, commands, paths, and literal values.
- Accuracy over completeness. Only state behavior you can confirm in the source repo. Never invent fields, limits, or steps. If a detail is uncertain, leave it out and flag it in the PR.

### Structure

- Each capability gets an overview page: what it is and when to use it.
- Add task sub-pages for specific actions.
- Embed 1-2 real use-case examples naturally in prose.
- Keep content primarily text. Add a screenshot only when text cannot carry it. Do not add videos, except on the welcome page.
- Reuse existing components: `<AccordionGroup>` and `<Accordion>` for FAQ and troubleshooting, tables for task or command lists, and `<CardGroup>` and `<Card>` for landing pages. Cards have no icons.
- Do not introduce colored callouts. Styling is neutral by design.
- Place new pages in the correct `docs.json` nav group: Core capabilities, Integrations, Administration, or Troubleshooting.
- Put setup, sign-in, and troubleshooting pages at the end of a group.
- Make minimal, targeted edits. Do not rewrite or restructure pages that are not part of the change.

### What to document

- Document only user-facing features that have shipped.
- Skip internal tooling, admin-only internals, experimental flags, and anything labeled "Saga Lab". Saga Lab is internal and should not be mentioned.
- Use consistent terminology: workspace, project, knowledge base, assistant, model, custom assistant, citations, grid review, workflows, legal research, organizational sources, practice areas, library, Personal, and Organization.

### Localization

- Make the change in English first under `guides/`.
- The guide is localized. Confirm the actual locale folders in the repo before adding localized pages.
- If Translate automation is enabled, let it sync the other locales.
- Otherwise, replicate the change into each locale folder and follow the style of the existing translated files.
- When adding or moving a page, update every language's navigation in `docs.json` so the structure stays aligned.
- In localized pages, links must stay in the same language path. For example, Spanish pages link to `/es/...`, not `/guides/...`.

### Pull requests

- Keep one focused change per PR. Do not bundle unrelated features.
- Use Conventional Commits titles: `docs: ...` or `docs(scope): ...`, for example `docs(integrations): add NetDocuments guide`.
- In the PR description, summarize what changed, link the source PR or commit and any referenced Linear issue, and call out anything that could not be verified.

## Verification before writing

- Read `docs.json` first to understand where the page belongs.
- Search existing docs before creating a new page. Update an existing page when the topic already exists.
- Read 2-3 nearby pages in the same section before writing.
- Verify product behavior from the source application repo, PR, commit, or existing docs before documenting it.
- For integration docs, verify behavior in the corresponding app repo. For example, verify Outlook add-in behavior in the Outlook add-in repo before documenting Outlook setup or sign-in behavior.
- Build a proper background understanding before writing: product surface, user flow, visible labels, permissions, limits, setup steps, and failure states.
- If behavior cannot be verified from source, do not document it as fact. Leave it out or flag it as an open question in the PR.

## Recommended wording

Prefer:

- "workspace" for the organization environment.
- "project" for a matter or body of work.
- "knowledge base" for documents stored in a project.
- "assistant" for a configured AI helper.
- "model" for the underlying AI model.
- "custom assistant" for an assistant configured by the workspace.
- "citations" for source references.
- "organizational sources" for shared internal sources.
- "Personal" and "Organization" for library categories.
- "sign in" as a verb and "sign-in" as an adjective or noun.
- "set up" as a verb and "setup" as a noun or adjective.

Avoid:

- "the user" when "you" works.
- Marketing terms such as "seamless", "powerful", "revolutionary", "game-changing", or "robust".
- Vague phrases such as "leverage", "utilize", "streamline your workflow", or "unlock productivity".
- Internal labels, feature flag names, API names, or implementation details that are not visible to readers.
- Unverified marketplace, AppSource, permission, limit, or setup claims.

## Formatting and validation

- Every MDX page needs frontmatter with `title`.
- Add `description` only when nearby pages use it or the page benefits from search context.
- Use root-relative internal links without `.mdx`.
- Keep code blocks language-tagged.
- Run `mint validate`.
- Run `mint broken-links`.
- Run `git diff --check`.
- If broken links already exist outside the change, report them separately and do not fix unrelated pages unless asked.
