# ADR-001: Apple-native application stack

- **Status:** Proposed
- **Date:** 2026-07-12

## Context

North Finance is intended to deliver a polished macOS experience first, followed
by iPhone and optional iCloud synchronization. Privacy, offline behavior, native
usability, performance, and long-term maintainability are higher priorities than
shipping the same UI code to many platforms immediately.

## Decision

Use:

- Swift as the implementation language;
- SwiftUI for macOS and iPhone presentation;
- SwiftData for local Apple-platform persistence, subject to a schema prototype;
- CloudKit only in a later opt-in synchronization phase.

Keep financial domain rules independent from SwiftUI, SwiftData, and CloudKit.

## Consequences

Positive:

- native integration and accessibility behavior;
- strong fit with macOS and iPhone interaction models;
- offline storage without a required external backend;
- a direct route to optional CloudKit synchronization.

Trade-offs:

- a future Windows interface cannot reuse SwiftUI directly;
- SwiftData and CloudKit schema constraints require early migration testing;
- sharing every UI component between macOS and iPhone may harm native usability.

## Alternatives considered

### Flutter

Rejected for the initial phase because cross-platform UI reuse is less valuable
than native Apple integration for the current scope.

### Web or Electron application

Rejected because it adds runtime and platform-integration costs without solving a
current requirement.

### Independent backend from day one

Deferred. It increases security, privacy, operations, and account-management
scope before synchronization has been validated as necessary.

## Review trigger

Revisit this decision if Windows becomes committed product scope or if a SwiftData
prototype cannot satisfy migration, recovery, or synchronization requirements.
