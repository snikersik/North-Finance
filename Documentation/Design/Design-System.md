# North Finance Design System Foundations

## Experience goal

The interface should communicate calm, control, and trust. It should feel native
to Apple platforms without copying another finance product or replacing familiar
platform behavior with novelty.

## Principles

- clarity before density;
- hierarchy before decoration;
- progressive disclosure for advanced information;
- consistent spacing and alignment;
- restrained, purposeful motion;
- color never carries meaning alone;
- native controls unless a custom component provides measurable UX value.

## Visual direction

The starting direction combines an understated dark navy foundation with clear
neutral surfaces and a cool blue/teal accent. Gold may be reserved for meaningful
goal milestones, not general decoration.

Exact color values are intentionally deferred until contrast and light/dark mode
tests are performed. Feature-specific colors must come from semantic tokens rather
than hard-coded values.

## Token groups

- background, surface, elevated surface;
- primary, secondary, and tertiary text;
- accent and selection;
- positive, caution, and destructive states;
- separators and focus rings;
- compact, regular, and spacious layout metrics;
- corner radii, shadows, and motion durations.

## Implemented foundations

The first design-system layer lives in `NorthFinance/DesignSystem` and exposes
semantic SwiftUI values. Feature views should consume these names rather than
selecting visual values directly.

### Colors

`NorthColor` maps semantic roles to adaptive macOS system colors. The mappings
automatically respond to light mode, dark mode, increased contrast, accent-color
selection, and other system appearance settings.

| Role | Token |
| --- | --- |
| Window background | `NorthColor.background` |
| Standard surface | `NorthColor.surface` |
| Elevated surface | `NorthColor.elevatedSurface` |
| Primary text | `NorthColor.primaryText` |
| Secondary text | `NorthColor.secondaryText` |
| Tertiary text | `NorthColor.tertiaryText` |
| Accent and selection | `NorthColor.accent`, `NorthColor.selection` |
| Positive, caution, destructive | `NorthColor.positive`, `NorthColor.caution`, `NorthColor.destructive` |
| Separator and focus | `NorthColor.separator`, `NorthColor.focus` |

Status colors must be paired with a text label, icon, or other non-color cue.
The colors are not final brand values.

### Layout metrics

- `NorthSpacing.compact`: 8 points;
- `NorthSpacing.regular`: 16 points;
- `NorthSpacing.spacious`: 24 points;
- `NorthRadius.control`: 8 points;
- `NorthRadius.card`: 12 points;
- `NorthRadius.panel`: 16 points.

`NorthLayout` contains reusable structural measurements that should not be
repeated in feature views, including the minimum summary-card width and maximum
content width.

## Typography

Use the system typography stack (SF family on Apple platforms) through semantic
styles. Financial amounts require tabular digits where comparison benefits from
stable alignment. Do not encode hierarchy solely through font weight.

`NorthTypography` currently provides semantic page-title, card-title, body,
secondary, and financial-amount fonts. The `financialAmountStyle()` modifier
applies the financial amount typography and tabular digits while preserving
Dynamic Type behavior. Custom font files are not used.

## Core components

The initial implementation should validate only components used by the first
vertical slice:

- application sidebar and toolbar;
- summary card;
- amount and trend presentation;
- transaction row;
- category marker;
- primary, secondary, and destructive actions;
- amount, currency, category, and date fields;
- empty, loading, error, and privacy-hidden states;
- accessible chart legend and data table alternative.

### Summary card

`SummaryCard` is the first implemented reusable component. It accepts a
localizable title and arbitrary SwiftUI content, applies the standard card
surface, separator, padding, and radius tokens, and contains no financial
business logic. The Overview screen demonstrates it with neutral em-dash values
only; it does not create or simulate financial records.

The Overview previews cover light appearance, dark appearance, and an
accessibility Dynamic Type size.

## Motion

Motion explains hierarchy, continuity, or action feedback. It must respect Reduce
Motion and must not delay data entry. Decorative entrance animations are not a
completion criterion.

## Accessibility baseline

- full keyboard navigation on macOS;
- visible and consistent focus treatment;
- VoiceOver labels and meaningful element grouping;
- sufficient contrast in light and dark appearances;
- non-color status indicators;
- scalable layouts and localized text tolerance;
- chart information available in a non-visual form.

## Content tone

Messages are direct, calm, and constructive. Prefer:

> To stay within this month's plan, the daily average is 84 PLN.

over judgmental language such as:

> You exceeded your budget.

## Brand mark direction

The accepted exploration direction combines a compass with an upward financial
path: orientation plus progress. It remains a concept until icon legibility,
originality, and App Store asset requirements are tested.
