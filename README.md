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

The project is in **v0.2 — Core application shell**. The repository includes a
native macOS SwiftUI project with sidebar navigation, placeholder feature views,
a versioned local SwiftData transaction foundation, English and Polish
localization, and a unit test target. Synchronization remains intentionally out
of scope for this phase.

See:

- [Roadmap](ROADMAP.md)
- [Product vision](Documentation/Product/Vision.md)
- [Product principles](Documentation/Product/Principles.md)
- [Architecture overview](Documentation/Architecture/Overview.md)
- [Design system foundations](Documentation/Design/Design-System.md)
- [Localization guide](Documentation/Localization.md)
- [Contributing guide](CONTRIBUTING.md)

## Development

Requirements:

- macOS 14 or later;
- Xcode with the macOS 14 SDK or later.

Open `NorthFinance.xcodeproj` in Xcode, select the `NorthFinance` scheme, and run
the macOS target. Command-line verification uses:

```sh
xcodebuild -project NorthFinance.xcodeproj \
  -scheme NorthFinance \
  -destination 'platform=macOS' \
  build

xcodebuild -project NorthFinance.xcodeproj \
  -scheme NorthFinance \
  -destination 'platform=macOS' \
  test
```

The application shell has no external dependencies. SwiftData is configured for
local persistence; CloudKit is not configured.

## Repository policy

GitHub is the source of truth for code, documentation, roadmap items, Issues,
and Pull Requests. Material changes are developed on a dedicated branch and
reviewed through a Pull Request. Accepted decisions must not be changed without
an explicit rationale recorded in the repository.

## License

No open-source license has been granted. All rights are reserved unless a future
decision states otherwise.
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

The project is in **v0.2 — Core application shell**. The repository includes a
native macOS SwiftUI project with sidebar navigation, placeholder feature views,
and a unit test target. Persistence and synchronization remain intentionally out
of scope for this phase.

See:

- [Roadmap](ROADMAP.md)
- [Product vision](Documentation/Product/Vision.md)
- [Product principles](Documentation/Product/Principles.md)
- [Architecture overview](Documentation/Architecture/Overview.md)
- [Design system foundations](Documentation/Design/Design-System.md)
- [Contributing guide](CONTRIBUTING.md)

## Development

Requirements:

- macOS 14 or later;
- Xcode with the macOS 14 SDK or later.

Open `NorthFinance.xcodeproj` in Xcode, select the `NorthFinance` scheme, and run
the macOS target. Command-line verification uses:

```sh
xcodebuild -project NorthFinance.xcodeproj \
  -scheme NorthFinance \
  -destination 'platform=macOS' \
  build

xcodebuild -project NorthFinance.xcodeproj \
  -scheme NorthFinance \
  -destination 'platform=macOS' \
  test
```

The application shell has no external dependencies and does not configure
SwiftData or CloudKit.

## Repository policy

GitHub is the source of truth for code, documentation, roadmap items, Issues,
and Pull Requests. Material changes are developed on a dedicated branch and
reviewed through a Pull Request. Accepted decisions must not be changed without
an explicit rationale recorded in the repository.

## License

No open-source license has been granted. All rights are reserved unless a future
decision states otherwise.
