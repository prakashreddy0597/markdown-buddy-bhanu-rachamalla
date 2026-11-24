# AI Assistance Declaration: I used ChatGPT (model/version not exposed),
# 24 November 2026, for an illustrative R script supporting the supplied
# Markdown Buddy documentation brief. Prompts and attribution: Appendix_AI.md.
# Assistant-executed checks are recorded in docs/Validation.md; student
# verification is not claimed. All final calculations are done by myself.
# I am responsible for the accuracy and originality of this work.
# Clarification: this script plots invented input values and computes no
# analysis metrics. The code is AI-generated, not an existing student script.

# Import validated synthetic counts and write one descriptive chart.
plot_orders <- function(input_file = "data/synthetic_orders.csv",
                        output_file = "outputs/orders_by_product.png") {
  if (!file.exists(input_file)) {
    stop("Input file not found: ", input_file, call. = FALSE)
  }
  orders <- utils::read.csv(input_file, comment.char = "#",
                            stringsAsFactors = FALSE)
  if (!identical(names(orders), c("product", "orders"))) {
    stop("Input must have exactly these columns: product, orders.", call. = FALSE)
  }
  if (nrow(orders) == 0L || anyNA(orders$product) ||
      any(!nzchar(trimws(orders$product))) || anyDuplicated(orders$product)) {
    stop("Product labels must be non-empty, present and unique.", call. = FALSE)
  }
  if (!is.numeric(orders$orders) || anyNA(orders$orders) ||
      any(!is.finite(orders$orders)) || any(orders$orders < 0) ||
      any(orders$orders != floor(orders$orders))) {
    stop("Order counts must be finite, non-negative whole numbers.", call. = FALSE)
  }
  dir.create(dirname(output_file), recursive = TRUE, showWarnings = FALSE)
  grDevices::png(output_file, width = 1000, height = 650, res = 130)
  on.exit(grDevices::dev.off(), add = TRUE)
  graphics::par(mar = c(5, 5, 4, 2))
  graphics::barplot(orders$orders, names.arg = orders$product,
                   col = "#246B68", border = NA,
                   main = "Cedar Cafe: synthetic orders by product",
                   xlab = "Product", ylab = "Supplied fictional order count")
  invisible(orders)
}

# Running this file directly creates the default chart; sourcing defines the function.
if (sys.nframe() == 0L) {
  plot_orders()
}
