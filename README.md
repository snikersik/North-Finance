# North Finance

North Finance is a privacy-first personal finance application for the Apple
ecosystem. The first product target is macOS, followed by iPhone and optional
iCloud synchronization.

## Product direction

North Finance should help people understand their financial situation and make
better decisions without turning everyday money management into a complicated
accounting task.

The product is built around four promises:

- data stays private and under the user's control;
- the essential experience works offline;
- everyday actions remain fast and simple;
- financial information is presented calmly and clearly.

## Platforms and technology

- macOS first
- iPhone after the macOS foundation is stable
- Swift and SwiftUI
- SwiftData for local persistence
- CloudKit in a later, separately tested synchronization phase

The base currency is PLN. The initial currency set is PLN, EUR, USD, GBP, and
CHF. Each transaction will retain its original currency and the exchange-rate
context used for reporting.

## Current status

The project is in **Sprint 0 — Foundation**. This repository currently contains
the product and technical foundations. Application code will be introduced in a
separate pull request after the foundation is reviewed.

See:

- [Roadmap](ROADMAP.md)
- [Product vision](Documentation/Product/Vision.md)
- [Product principles](Documentation/Product/Principles.md)
- [Architecture overview](Documentation/Architecture/Overview.md)
- [Design system foundations](Documentation/Design/Design-System.md)
- [Contributing guide](CONTRIBUTING.md)

## Repository policy

GitHub is the source of truth for code, documentation, roadmap items, Issues,
and Pull Requests. Material changes are developed on a dedicated branch and
reviewed through a Pull Request. Accepted decisions must not be changed without
an explicit rationale recorded in the repository.

## License

No open-source license has been granted. All rights are reserved unless a future
decision states otherwise.
# North-Finance
A premium personal finance platform for the Apple ecosystem. Built with privacy, performance and simplicity in mind
