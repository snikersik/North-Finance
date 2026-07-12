# Conceptual Data Model

## Purpose

This document defines language and invariants, not a final SwiftData schema. The
schema will be prototyped and tested for migration and CloudKit compatibility
before it becomes an accepted contract.

## Core concepts

### Money

- amount represented with decimal semantics, never `Double` or `Float`;
- ISO 4217 currency code;
- explicit rounding rule at calculation and display boundaries.

Initial currencies: PLN, EUR, USD, GBP, and CHF.

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
