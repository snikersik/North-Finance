# North Finance Roadmap

This roadmap communicates direction, not fixed dates. GitHub Issues define the
executable backlog. A phase advances only when its exit criteria are met.

## v0.1 — Foundation (current)

Goal: establish the product, architecture, and working agreements before
application development begins.

- [x] Define product vision and principles
- [x] Define the initial Apple-native technology direction
- [x] Define high-level architecture and data-model boundaries
- [x] Define design-system foundations
- [x] Establish contribution, decision, and changelog practices
- [ ] Review and accept the foundation Pull Request
- [ ] Convert the next milestones into scoped GitHub Issues

Exit criteria:

- foundation documentation is reviewed and merged;
- unresolved product decisions are explicitly listed;
- the first implementation slice has a clear Issue and acceptance criteria.

## v0.2 — Core application shell

Goal: create a buildable macOS project with the shared foundations needed by
future features.

- Xcode project and macOS target
- app navigation shell
- design tokens and core reusable components
- local SwiftData container
- test targets and initial CI
- localization foundation
- empty, first-run, loading, and error states

## v0.3 — Transactions and monthly overview

Goal: deliver the first useful offline workflow.

- create, edit, and delete income and expense transactions
- categories and basic search/filtering
- PLN, EUR, USD, GBP, and CHF transaction entry
- exchange-rate snapshot stored with converted transactions
- monthly income, expenses, and remaining amount
- category breakdown and recent transactions
- unit tests for all financial calculations

## v0.4 — Budgets and recurring costs

- category budgets and calm threshold notifications
- recurring income and expenses
- housing and fixed-cost views
- end-of-month projection based on transparent rules

## v0.5 — Goals and liabilities

- savings goals
- loans and repayment progress
- early-repayment simulations
- clear separation between actual data and forecasts

## v0.6 — Assets

- vehicles and their operating costs
- real estate and savings accounts
- extensible asset model without exposing every asset type in primary navigation

## v0.7 — Analytics

- month-to-month comparisons
- trends, anomalies, and rule-based insights
- explainable recommendations
- no external AI service required for core analytics

## v0.8 — iPhone and synchronization

- adaptive iPhone interface using the shared domain layer
- CloudKit compatibility audit and migration rehearsal
- opt-in iCloud synchronization
- conflict, deletion, offline, and recovery tests

## v1.0 — First stable release

- complete privacy and accessibility review
- migration and backup/restore validation
- performance and stability sign-off
- release documentation and support workflow

## Later candidates

These are not committed scope: receipt OCR, bank CSV import, widgets, Touch ID
app lock, Apple Watch, investments, and a platform-independent synchronization
backend. Each requires a separate product and privacy assessment.
