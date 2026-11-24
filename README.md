> **AI Assistance Declaration:** I used ChatGPT (model/version not exposed), on 24 November 2026, for README drafting, Markdown formatting, an illustrative R script, R Markdown documentation, and reflection drafting. Prompts used: the supplied Markdown Buddy brief and its seed, refinement, and validation prompts, recorded in [Appendix_AI.md](Appendix_AI.md). I verified outputs using assistant-executed R rendering, link checks, and local previews; independent student review is not claimed. All final calculations are done by myself. I am responsible for the accuracy and originality of this work. No analysis metrics are calculated here: the chart displays supplied synthetic values. All writing and example code are AI-generated.

# Cedar Café Orders

A small R documentation project that turns fictional product-level order counts into a labeled bar chart. It demonstrates a reproducible script, a concise README, and documentation for one script using R Markdown.

**Author:** Bhanu Rachamalla · **Course:** BDA400 · **Repository:** `markdown-buddy-bhanu-rachamalla`

## Overview

The project illustrates a café report using invented data. It does not analyze real customers, forecast sales, or calculate business performance. Each count is an illustrative input value, not a measured result.

## Project files

```text
markdown-buddy-bhanu-rachamalla/
├── README.md
├── Reflection.md
├── Appendix_AI.md
├── .gitignore
├── data/
│   └── synthetic_orders.csv
├── scripts/
│   └── plot_orders.R
└── docs/
    ├── README_Outline.md
    ├── Script_Guide.Rmd
    └── Validation.md
```

Generated charts go in `outputs/`, which is excluded from version control. Rendered previews and screenshots are supplied separately as verification evidence.

## Requirements and installation

- R 4.4 or later for the demonstrated workflow.
- Base R only for the plotting script; no external plotting package is required.
- `rmarkdown`, `knitr`, and Pandoc for rendering the documentation. RStudio commonly supplies Pandoc; otherwise install it separately.

Download or clone this project, extract it if necessary, and open R or RStudio **in the project root**. Install the documentation packages once:

```r
install.packages(c("rmarkdown", "knitr"))
```

The script itself does not install packages or download data.

## Inputs

[data/synthetic_orders.csv](data/synthetic_orders.csv) contains two columns:

| Column | Meaning | Validation |
| --- | --- | --- |
| `product` | Fictional beverage name | Non-empty, unique text |
| `orders` | Invented order count | Finite, non-negative whole number |

Lines beginning with `#` contain the required AI declaration and are ignored by the script's CSV reader. The table does not contain personal information or actual café records.

## Example usage

Run this code from the project root:

```r
source("scripts/plot_orders.R")
orders <- plot_orders()
print(orders)
```

Alternatively, run the script from a terminal in the project root:

```sh
Rscript scripts/plot_orders.R
```

To choose a different output filename:

```r
plot_orders(output_file = "outputs/custom_orders.png")
```

## Outputs

- `outputs/orders_by_product.png`: bar chart of the supplied counts, with labeled axes and a synthetic-data title.
- The function invisibly returns the imported table, allowing inspection without recomputing totals or averages.
- Invalid input causes an explanatory error before a chart is written. An existing output file at the selected path is overwritten.

The chart is descriptive of the invented inputs only. It provides no evidence about customer preferences or commercial demand.

## R Markdown documentation

[docs/Script_Guide.Rmd](docs/Script_Guide.Rmd) documents the single plotting script: purpose, input schema, output, code walkthrough, execution, and limitations.

From the project root, render it with:

```r
rmarkdown::render(
  "docs/Script_Guide.Rmd",
  output_file = "Script_Guide.html",
  output_dir = "docs",
  knit_root_dir = getwd()
)
```

You can also open the `.Rmd` in RStudio and select **Knit**. An HTML document is the default output. See [the validation record](docs/Validation.md) for the checks actually completed and remaining GitHub-specific checks.

## Troubleshooting

- **Input file not found:** use the project root as your working directory, or pass the correct `input_file` argument.
- **Pandoc unavailable:** install Pandoc or render through an RStudio installation that provides it.
- **Input validation error:** check the column names, product labels, and count values against the input schema.
- **Cannot write output:** choose a directory where you have write permission. Check that the selected destination is not a directory.

## License

No open-source license has been selected for this educational project. Public visibility, if later enabled, does not itself grant an open-source reuse license. The repository owner should choose an appropriate license before distributing it for reuse.

## References

- [GitHub Markdown syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)
- [tidyverse/ggplot2 README](https://github.com/tidyverse/ggplot2/blob/main/README.md), compared for overview, installation, usage, and help structure; its text and example data were not copied.
- [R Markdown code chunks](https://rmarkdown.rstudio.com/lesson-3.html)

## AI Assistance Disclosure

**Tool:** ChatGPT; model/version not exposed; date: 24 November 2026.

**Main prompts:** explain a good R-project README structure; draft documentation for the synthetic café visualization; add Installation, Example Code, and License; review syntax and suggest two clarity improvements; document one R script using organized R Markdown chunks. Exact prompts, responses, and refinement notes are in [Appendix_AI.md](Appendix_AI.md).

**Refinements made by the assistant:** separated base-R script dependencies from rendering dependencies; made the project-root requirement explicit; documented generated outputs, input errors, and overwrite behavior; replaced an assumed license with an honest license status; distinguished executable chunks from display-only examples.

**Verification:** see [docs/Validation.md](docs/Validation.md). Local checks are not GitHub's Preview tab, and assistant verification is not student verification. GitHub upload requires working account access; no published repository URL is claimed. The underlying example script is AI-created for this exercise, not supplied by the student. The course's general design-only restriction conflicts with this code-generating assistance and is not claimed as satisfied.
