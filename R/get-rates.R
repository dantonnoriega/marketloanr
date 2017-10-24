#' input a score value and extracts
#' @param s score value
#' @param as_vec return as vector (TRUE) or dataset (FALSE). Default TRUE
#' @export

get_rates <- function(s, as_vec = TRUE) {

  dat <- get_loan_data()

  dat <- dat %>%
    dplyr::rowwise() %>%
    dplyr::mutate(keep = dplyr::between(s, rng_min, rng_max)) %>%
    dplyr::filter(keep == TRUE) %>%
    dplyr::select(-keep)

  if(as_vec) dat %>% dplyr::pull(rate) else dat

}