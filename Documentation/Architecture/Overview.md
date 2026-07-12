# Architecture Overview

## Status

Proposed foundation for review. Concrete package and target boundaries will be
validated when the Xcode project is introduced.

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

### Features

Vertical user-facing slices such as Overview, Transactions, Budgets, Goals,
Assets, Analytics, and Settings. Features compose domain behavior through
application use cases rather than reading storage ad hoc from every view.

### Data

SwiftData schemas, repositories, migrations, import/export, and later CloudKit
configuration. Persistence models may differ from domain types when this protects
migration safety or testability.

### Services

Clock, identifiers, exchange rates, files, security, and other system adapters.
Each service exposes a small interface so deterministic substitutes can be used
in tests.

## State and data flow

- SwiftData is the local source of truth for persisted user records.
- Views receive query results or presentation state through a clearly owned
  feature boundary.
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

- exact SwiftData schema and migration plan;
- minimum macOS and iOS deployment targets;
- project generation versus an Xcode-managed project;
- exchange-rate provider and refresh policy;
- CloudKit container and production environment;
- app-lock and backup implementation.

Each deferred item should become an Issue or ADR before implementation.
