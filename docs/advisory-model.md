# Advisory Model

`jixia-advisors` is named for Jixia, the Warring States Qi intellectual
community where rulers supported thinkers from multiple traditions near power.
In this project, Jixia means an adaptive advisory forum. It does not imply a
single doctrine, a fixed roster, or a rule that every question deserves a large
council.

The default use case is everyday counsel. A normal prompt should be able to use
one advisor, or one advisor plus a counter-lens, without turning routine work
into a ceremony. Broader questions can call three to five advisors. Ambiguous or
high-stakes work can use a Seven Sages-style mode with up to seven selected
views from the larger pool.

## Convening Models

- **Jixia:** default everyday mode. The router selects the most relevant lenses
  for the current question.
- **Seven Sages:** bounded synthesis mode. Use up to seven selected views when a
  question benefits from broader perspective without turning into a crowd.
- **Areopagus:** rigorous review mode for consequential public, product, or
  architectural decisions.
- **Junto:** self-improvement, personal systems, operating cadence, and
  habit-design mode.
- **Parishad:** stakeholder and coordination mode for tradeoffs across roles.
- **Yushitai:** critique, accountability, audit, and red-team mode.

These names are labels for operating patterns, not claims of direct historical
continuity. They should help the user choose the shape of advice needed for the
work in front of them.

## Benchmarking

The modes should be benchmarked against real work before they become defaults.
Useful comparisons:

- Single advisor vs one advisor plus counter-lens for everyday choices.
- Three to five selected advisors vs Seven Sages-style synthesis for ambiguous
  planning.
- Areopagus or Yushitai-style critique vs generic multi-agent review for
  high-stakes decisions.
- Junto-style counsel vs single-agent coaching for personal systems and habits.

Score outputs on usefulness, actionability, error catch rate, novelty, cost,
latency, and whether the result changed the next action. The expected winning
pattern is not always more agents. The likely strongest pattern is the smallest
set of independent, relevant perspectives that improves the work.
