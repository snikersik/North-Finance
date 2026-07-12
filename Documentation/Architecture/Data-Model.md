# Conceptual Data Model

## Purpose

This document defines domain language and the first local SwiftData persistence
slice. The V1 schema is intentionally minimal; relationships and synchronization
semantics remain deferred until their own vertical slices are designed and
tested.

## Core concepts

### Money

- amount represented with decimal semantics, never `Double` or `Float`;
- ISO 4217 currency code;
- explicit rounding rule at calculation and display boundaries.

Initial currencies: PLN, EUR, USD, GBP, and CHF.

`Money` stores a Foundation `Decimal` and `CurrencyCode`. The Domain layer never
uses `Double` or `Float` for financial amounts.

### Transaction

- stable identifier;
- kind: income, expense, or transfer;
- original amount and currency;
- booking date and optional note;
- category reference;
- optional account reference;
- exchange-rate snapshot when included in base-currency reports;
- creation and modification timestamps;
- deletion behavior compatible with later synchronization.

A transfer must not inflate income or expenses. Editing a historical exchange
rate must be an explicit action; refreshed rates must not silently rewrite past
reports.

## SwiftData transaction schema V1

`TransactionRecord`, registered by `NorthFinanceSchemaV1`, persists only:

- stable UUID;
- transaction-kind raw value;
- original amount in canonical decimal text form;
- original currency raw value;
- booking date;
- optional note;
- creation and modification timestamps.

The amount is encoded with `NSDecimalString` using the `en_US_POSIX` locale and
decoded with `Decimal(string:locale:)`. A canonical text column is used instead
of binary floating point or an opaque transformable value. This makes the stored
representation locale-independent, inspectable, migration-friendly, and capable
of reproducing the exact decimal value on read. Tests exercise small, negative,
and high-precision amounts through a complete SwiftData save/fetch round trip.

The schema is registered through `NorthFinanceMigrationPlan`. V1 has no migration
stages because there is no earlier shipped schema. Later versions must append a
new schema and an explicit lightweight or custom stage.

## Repository boundary

`TransactionRepository` belongs to Domain and defines insert, fetch, update, and
delete operations in domain terms. `SwiftDataTransactionRepository` belongs to
Data, retains its injected `ModelContainer` for the repository lifetime, and owns
all mapping to and from `TransactionRecord`. Updates preserve the stable UUID and
creation timestamp while assigning a new modification timestamp.

The production `ModelContainer` is created only in the application composition
root. Tests create a new in-memory container for each repository, so test records
cannot reach the application store or another test container.

No seed or preview transaction is inserted automatically. A fresh application
container and every fresh in-memory test container start empty.

## Deferred relationships

V1 intentionally has no category, account, transfer-pair, or exchange-rate
relationships. Deletion is explicit at the repository boundary. These relations,
their delete rules, and any CloudKit implications require separate schema
versions and migration tests before implementation.

### Category

- stable identifier and localized display name;
- income or expense applicability;
- icon and color token references;
- user-defined ordering and archived state.

Archiving preserves historical transactions.

### Account

A container for money such as cash, current account, savings account, or credit
account. The first vertical slice may operate with one default account, but the
model must not assume that a user will always have exactly one.

### Budget

- category or group scope;
- time period;
- limit in a specified currency;
- rollover policy explicitly represented rather than implied.

### Recurrence

A rule describing a planned future occurrence. Generated transactions must be
distinguishable from templates and avoid duplicates.

### Goal

- target amount and currency;
- current contribution source;
- optional target date;
- progress derived from authoritative contributions.

### Liability

- principal and currency;
- interest terms;
- payment schedule;
- actual payments separated from projections.

### Asset

An extensible record for owned value. Domain-specific details such as vehicle
mileage belong to a typed extension or feature model, not a single unbounded
asset table.

### ExchangeRateSnapshot

- source and target currencies;
- decimal rate;
- effective timestamp;
- origin: manual, imported, or provider;
- provenance metadata where available.

## Reporting currency

PLN is the default base currency. Changing the reporting currency changes views
and derived totals; it must not mutate original transaction amounts.

## Invariants to test

- monetary calculations are deterministic and explicitly rounded;
- a transaction always keeps its original amount and currency;
- transfers are neutral in income/expense reports;
- archived categories retain historical integrity;
- deleting related objects cannot silently delete financial history;
- exchange-rate changes do not silently alter locked historical snapshots;
- synchronization conflicts cannot produce duplicate transactions.

## Privacy

Models must avoid storing unnecessary sensitive data. Logs, previews, fixtures,
and analytics must never contain a user's real financial records.
