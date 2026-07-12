# Product Vision

## Mission

North Finance helps people take control of their finances in a simple, private,
and intelligent way.

## User outcome

After opening North Finance, a user should quickly understand:

- where their money went;
- what remains available;
- which commitments are approaching;
- what action would improve their situation.

The intended emotional outcome is **calm and control**, not judgment or anxiety.

## Initial audience

The first user is an individual managing personal finances on a Mac, with PLN
as their primary currency and occasional spending in EUR, USD, GBP, or CHF.

The product should work for one person exceptionally well before expanding to
shared or household finances.

## Product position

North Finance is not an accounting system, bank, investment adviser, or a set of
decorative charts. It is an offline-first personal finance workspace that turns
user-owned data into understandable, actionable information.

## Platform strategy

1. Build and stabilize the macOS experience.
2. Extract and reuse domain behavior for an adaptive iPhone experience.
3. Add optional CloudKit synchronization only after local data integrity,
   migrations, deletions, conflicts, and recovery are tested.
4. Keep UI, domain rules, and persistence sufficiently separated to preserve a
   future path to other platforms without designing for Windows prematurely.

## Success signals

Early success is measured through behavior and quality rather than downloads:

- adding a common transaction takes only a few seconds;
- monthly totals are correct and explainable;
- the app remains useful without a network connection;
- users can export or recover their data;
- no feature requires sending financial data to a third party by default;
- the interface remains understandable as data volume grows.

## Non-goals for the first release

- bank account aggregation;
- automated financial advice;
- trading or investment execution;
- household collaboration;
- Windows support;
- mandatory accounts, subscriptions, or cloud connectivity.
