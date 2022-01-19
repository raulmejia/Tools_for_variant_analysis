GeomSection <- ggproto("GeomSection", GeomPolygon, 
                       default_aes = list(fill="blue", size=0, alpha=0.2, colour=NA, linetype="dashed"), 
                       required_aes = c("slope", "intercept", "above"),
                       draw_panel = function(data, panel_params, coord) {
                         ranges <- coord$backtransform_range(panel_params)
                         data$group <- seq_len(nrow(data))
                         data <- data %>% group_by_all %>% do(buildPoly(.$slope, .$intercept, .$above, ranges$x, ranges$y)) %>% unnest
                         GeomPolygon$draw_panel(data, panel_params, coord)
                       }
)

geom_section <- function (mapping = NULL, data = NULL, ..., slope, intercept, above, 
                          na.rm = FALSE, show.legend = NA) {
  if (missing(mapping) && missing(slope) && missing(intercept) && missing(above)) {
    slope <- 1
    intercept <- 0
    above <- TRUE
  }
  if (!missing(slope) || !missing(intercept)|| !missing(above)) {
    if (missing(slope)) 
      slope <- 1
    if (missing(intercept)) 
      intercept <- 0
    if (missing(above)) 
      above <- TRUE
    data <- data.frame(intercept = intercept, slope = slope, above=above)
    mapping <- aes(intercept = intercept, slope = slope, above=above)
    show.legend <- FALSE
  }
  layer(data = data, mapping = mapping, stat = StatIdentity, 
        geom = GeomSection, position = PositionIdentity, show.legend = show.legend, 
        inherit.aes = FALSE, params = list(na.rm = na.rm, ...))
}
