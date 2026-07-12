# Security Policy

North Finance handles sensitive personal financial information. Security and
privacy reports must not include a user's real records unless an explicitly
approved secure channel is available.

## Reporting a vulnerability

Use GitHub private vulnerability reporting:

https://github.com/snikersik/North-Finance/security/advisories/new

Do not open a public Issue for a suspected vulnerability. Include:

- affected version or commit;
- reproducible steps using synthetic data;
- expected impact;
- any known mitigation.

Do not attempt to access another person's data, disrupt services, or retain data
that is not yours while investigating a problem.

## Supported versions

The application has not reached a public release. Support commitments will be
defined before v1.0.

## Project security baseline

- core features operate locally without mandatory external services;
- secrets and signing material are never committed;
- logs and test fixtures must not contain real financial records;
- new dependencies require a privacy and maintenance assessment;
- persistence and synchronization changes require data-loss and migration review.
