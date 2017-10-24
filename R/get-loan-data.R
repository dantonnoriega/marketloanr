#' get loan data
#' @importFrom magrittr %>%
#' @param x path to csv file.

get_loan_data <- function() {

  x <- "data-raw/Market Loan Terms MASTER.csv"

  dat <- readr::read_csv(x) %>%
    dplyr::mutate_if(is.character, dplyr::funs(gsub('\\$|,|%|-', '', .))) %>%
    dplyr::select(-state, -dplyr::contains('modelyear')) %>%
    dplyr::select(name:program, LTV_index, dplyr::everything()) %>%
    dplyr::mutate_at(5:55, as.numeric) %>%
    dplyr::select(-dplyr::contains('loan_amt'), -warranty_max) %>%
    dplyr::mutate(name = iconv(name, "latin1", "ASCII", sub = " ")) %>%
    dplyr::mutate(name = gsub("[ ]+", " ", name))

  dat <- dat %>%
    tidyr::gather(key = 'rate_name', value = 'rate', Aplus:M_rng_min) %>%
    dplyr::filter(!is.na(rate))

}