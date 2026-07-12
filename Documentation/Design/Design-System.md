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

## Typography

Use the system typography stack (SF family on Apple platforms) through semantic
styles. Financial amounts require tabular digits where comparison benefits from
stable alignment. Do not encode hierarchy solely through font weight.

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
