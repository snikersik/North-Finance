# Architecture Overview

## Status

The modular-monolith boundaries are active in the macOS target. The initial
Domain and Data vertical slice provides local transaction persistence while the
existing App, DesignSystem, and Features boundaries remain separate.

## Architectural style

North Finance begins as a **modular monolith**. A single product repository and
application avoid premature package complexity, while explicit boundaries keep
features testable and reusable across macOS and iPhone.

The architecture separates four concerns:

```text
SwiftUI presentation
        ↓
Application use cases
        ↓
Domain model and finance rules
        ↓
Persistence / synchronization / system adapters
```

Dependencies point inward. Domain calculations must not depend on SwiftUI,
SwiftData, CloudKit, or platform-specific view code.

## Planned boundaries

### App

Application lifecycle, dependency composition, platform commands, scenes, and
navigation roots.

### Design System

Design tokens and reusable presentation components. It does not contain finance
rules or persistence behavior.

### Domain

Money, currency, transactions, categories, budgets, goals, liabilities, assets,
and calculation rules. This is the most stable layer and should be extensively
unit tested.

The current Domain slice contains `CurrencyCode`, `TransactionKind`, `Money`,
`FinancialTransaction`, and the `TransactionRepository` protocol. Domain source
files import Foundation only; they do not depend on SwiftData, SwiftUI, or AppKit.

### Features

Vertical user-facing slices such as Overview, Transactions, Budgets, Goals,
Assets, Analytics, and Settings. Features compose domain behavior through
application use cases rather than reading storage ad hoc from every view.

### Data

SwiftData schemas, repositories, migrations, import/export, and later CloudKit
configuration. Persistence models may differ from domain types when this protects
migration safety or testability.

The initial Data slice contains the versioned `NorthFinanceSchemaV1`, an explicit
`NorthFinanceMigrationPlan`, container factories, and
`SwiftDataTransactionRepository`. The repository maps persistence records to
domain values and is the only transaction persistence API exposed to future use
cases. Feature views must not import SwiftData or use `@Query` directly.

### Services

Clock, identifiers, exchange rates, files, security, and other system adapters.
Each service exposes a small interface so deterministic substitutes can be used
in tests.

## State and data flow

- SwiftData is the local source of truth for persisted user records.
- Views receive presentation state through a clearly owned feature boundary;
  future transaction use cases will depend on `TransactionRepository`.
- Writes go through explicit use cases that validate data and related invariants.
- Derived analytics are recalculated from authoritative records unless profiling
  proves that a cached projection is necessary.
- Cloud synchronization, when added, operates behind the data boundary and must
  not make the local workflow unavailable.

## Cross-platform approach

Domain rules, application use cases, and suitable design components should be
shared. Navigation and dense information layouts may differ between macOS and
iPhone. Sharing code is valuable only when it preserves native usability.

## Dependency policy

Apple frameworks are preferred where they satisfy requirements. A third-party
dependency needs a documented owner, purpose, update policy, privacy assessment,
and exit strategy.

## Quality strategy

- unit tests for money, conversion, budgets, projections, and recurrence;
- persistence tests for save, delete, relationships, and migrations;
- integration tests for import/export and synchronization boundaries;
- UI tests for critical workflows, not every visual detail;
- preview and accessibility review for reusable UI components.

## Decisions intentionally deferred

- minimum macOS and iOS deployment targets;
- project generation versus an Xcode-managed project;
- exchange-rate provider and refresh policy;
- CloudKit container and production environment;
- app-lock and backup implementation.

Each deferred item should become an Issue or ADR before implementation.

The first transaction schema and migration-plan boundary are now implemented.
Future schema changes must add a new `VersionedSchema` and an explicit migration
stage rather than modifying V1 in place.
