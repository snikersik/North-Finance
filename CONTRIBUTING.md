# Contributing to North Finance

North Finance is currently developed as a private product process even when the
repository is visible publicly. Opening an Issue does not imply that a proposed
feature will be accepted.

## Workflow

1. Start with a GitHub Issue for a material feature, bug, or decision.
2. Define scope and acceptance criteria before implementation.
3. Create a branch from the latest `main`.
4. Use focused commits with imperative English messages.
5. Run the relevant tests and build.
6. Open a draft Pull Request early for material work.
7. Update documentation and the changelog when behavior or decisions change.

Recommended branch prefixes:

- `feature/` for user-facing functionality
- `fix/` for corrections
- `docs/` for documentation-only work
- `chore/` for maintenance
- `agent/` for changes prepared by an automated coding agent

## Pull Request requirements

A Pull Request should explain:

- what changed and why;
- what is intentionally out of scope;
- how the change was verified;
- privacy, persistence, migration, and accessibility impact where relevant;
- any follow-up Issues required.

Material Pull Requests must not be merged while required checks are failing or
while data-loss risks remain unresolved.

## Definition of done

A change is done when:

- acceptance criteria are satisfied;
- relevant tests pass;
- the macOS target builds when application code is involved;
- user-facing text is localizable and accessible;
- persistence changes include a migration assessment;
- documentation reflects the final behavior;
- no unrelated files or secrets are included.
