# Layup Equilibria

An evolutionary game-theoretic model of strategic course selection at Dartmouth. Final project for MATH/QSS 30.04 (Evolutionary Game Theory), Spring 2026.

The compiled paper is in `EGT_final_project.pdf`. Source is `main.tex`.

## Abstract

> Many students at selective universities pick easy courses, often called "layups," mainly to protect their GPA. We model this with evolutionary game theory, treating the student body as a population evolving under replicator dynamics across three behavioral types, purists (s_A = 0.10), balancers (s_B = 0.35), and strategists (s_C = 0.70). Each student's payoff depends on their own layup intensity, the population mean, and a GPA-importance parameter w. Under calibrated competition intensity γ = 3.0, the model predicts that the strategist vertex is the unique strict ESS once w > 2.60. We test four predictions against a survey of n = 51 Dartmouth undergraduates. Three sign-tests hold in the predicted direction but fall short of conventional significance: higher GPA importance tracks with higher layup ratios, GPA-protective course avoidance correlates with both higher s and higher w, and perceived peer pressure correlates positively with s. Career tracks differ in mean layup ratio, but only marginally (F = 2.29, p = 0.062), and the predicted ordering does not hold. Two findings cut sharply against the model. Pre-medical students show one of the *lowest* observed layup ratios despite the highest w (suggestive only, n = 3), and the empirical population clusters at the balancer vertex rather than the strategist equilibrium predicted at w̄ = 3.59. We discuss explanations and show that eliminating enforced grading medians is predicted to *raise*, not lower, the equilibrium layup ratio.

## Repository layout

```
.
├── main.tex                          # paper source
├── refs.bib                          # bibliography (APA, biblatex)
├── EGT_final_project.pdf             # compiled paper
├── data/
│   ├── EGT Project (Responses).csv   # raw Google Form export, 51 responses
│   ├── cleaned_responses.csv         # cleaned dataset, 51 rows x 19 columns
│   └── stability_table.csv           # replicator-dynamics eigenvalues at w ∈ {1, 3, 5}
├── notebooks/
│   ├── 01_clean.ipynb                # raw → cleaned dataset
│   ├── 02_empirics.ipynb             # P1–P4 tests, OLS / ANOVA / t-test
│   └── 03_replicator_simplex.ipynb   # replicator dynamics, phase portraits, stability
└── figures/                          # PNG outputs from the notebooks
```

## Data

Three CSV files in `data/`:

- `EGT Project (Responses).csv` is the raw Google Form export.
- `cleaned_responses.csv` is the working dataset. Each row is one respondent. Columns of interest: `s` (the layup ratio, layups / courses, in [0, 1]), `w` (GPA importance, 1–5), `track` (career track: pre-med, finance/consulting, tech/engineering, graduate/PhD, government/nonprofit, undecided), `q7_score` (GPA-protective course avoidance, 0–2), `q9_score` (perceived peer pressure toward easy courses, −2 to +2).
- `stability_table.csv` is the output of the replicator-dynamics eigenvalue analysis at w ∈ {1, 3, 5}.

## Notebooks

Run in order:

1. `notebooks/01_clean.ipynb`. Loads the raw Google Form CSV, normalizes major names, encodes ordinal responses to numeric, computes `s`, and writes `data/cleaned_responses.csv`.
2. `notebooks/02_empirics.ipynb`. Tests the four predictions against the survey. OLS with HC1 standard errors for P1, ANOVA across tracks for P2, t-tests for P3, correlations for P4. Writes `figures/desc_overview.png`, `figures/p2_box_s_by_track.png`, `figures/p4_scatter_q9_s.png`.
3. `notebooks/03_replicator_simplex.ipynb`. Discrete three-type replicator dynamics with s_A = 0.10, s_B = 0.35, s_C = 0.70 and γ = 3.0. Forward Euler integration on the 2-simplex from a grid of starting points, then eigenvalue analysis at the vertices. Writes `figures/simplex_w{1,3,5}.png`, `figures/simplex_panel.png`, `figures/empirical_simplex.png`, and `data/stability_table.csv`.

## Reproducing the analysis

```bash
pip install pandas numpy scipy matplotlib statsmodels
jupyter notebook
```

Then open the three notebooks and run them in order. Outputs land in `data/` and `figures/`.

## License

MIT. See [`LICENSE`](LICENSE).
