# Changelog

All notable changes to North Finance will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
and the project intends to use semantic versioning once application releases
begin.

## [Unreleased]

### Added

- Reusable, localized empty, first-run, loading, and recoverable error state
  components built from native SwiftUI controls and semantic design tokens.
- English and Polish application-state copy, previews spanning accessibility
  conditions, and localization coverage for every new string.
- GitHub Actions CI for macOS builds and the complete unit test suite using
  Xcode 26.6, with failed test result bundles retained for diagnostics.
- English development localization and complete Polish localization for the
  current macOS interface, backed by an Xcode String Catalog.
- Localization resource tests and contributor guidance for adding future
  user-facing copy without coupling identifiers or persisted data to language.
- Domain primitives for supported currencies, transaction kinds, decimal money,
  and minimal financial transactions.
- Versioned SwiftData V1 transaction schema with an explicit migration plan and
  locale-independent canonical decimal storage.
- Transaction repository boundary with insert, fetch, update, and delete
  operations plus isolated in-memory persistence tests.
- Persistent application `ModelContainer` configured only at the composition
  root without sample financial records.
- Semantic design tokens for adaptive colors, spacing, corner radii, layout,
  and system typography.
- Reusable `SummaryCard` component and financial amount text style with tabular
  digits.
- Overview summary cards with neutral empty values and light, dark, and
  accessibility text-size previews.
- Native `NorthFinance` Xcode project targeting macOS 14.
- SwiftUI application shell with sidebar navigation for Overview, Transactions,
  Budgets, Goals, Assets, and Settings.
- Placeholder views for every initial application section, now presented through
  the shared empty-state component without non-functional actions.
- `NorthFinanceTests` unit test target covering the initial navigation model.
- Initial product vision and principles.
- Architecture and conceptual data-model foundations.
- Design-system foundations.
- Roadmap, contribution guide, repository agent instructions, and ADR process.

## [0.1.0] - TBD

### Planned

- Accepted Sprint 0 foundation documentation.
