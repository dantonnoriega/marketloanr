#' get loan data
#' @importFrom magrittr %>%
#' @param import path to csv file.
#' @export

get_loan_data <- function(import = FALSE) {

  if(import) {

    # get data from the internets
    x <- "https://github.com/dantonnoriega/marketloanr/blob/master/data-raw/market-loan-terms-master.csv.zip?raw=true"

    tmp <- tempfile(fileext = '.csv.zip')
    download.file(x, tmp)

    # read and clean data
    dat <- suppressMessages(readr::read_csv(tmp)) %>%
      dplyr::mutate_if(is.character, dplyr::funs(gsub('\\$|,|%|-', '', .))) %>%
      dplyr::select(-state, -dplyr::contains('modelyear')) %>%
      dplyr::select(name:program, LTV_index, dplyr::everything()) %>%
      dplyr::mutate_at(5:55, as.numeric) %>% # convert select cols to numeric
      dplyr::select(-dplyr::contains('loan_amt'), -warranty_max, -minrisk, -maxrisk) %>%
      dplyr::mutate(name = iconv(name, "latin1", "ASCII", sub = " ")) %>%
      dplyr::mutate(name = gsub("[ ]+", " ", name))

    loan_data <- dat %>%
      tidyr::gather(key = 'rate_name', value = 'rate', Aplus, A, B, C, D, E, F, G, H, I, J, K, L, M) %>%
      dplyr::filter(!is.na(rate)) %>%
      dplyr::filter(!is.na(name)) %>%
      dplyr::select(name:program, dplyr::contains('LTV_'), months_max, bank_fee, markup, dplyr::everything())


    # find and rename ranges by rating name structure
    rn <- c("Aplus", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M")

    hold <- lapply(rn, function(k) {
      # pull out shared columns and then only those starting with rating name (e.g. "Aplus_rng_max")
      k_ <- paste0(k, "_") # add underscore so we can distinguish Aplus from A
      tmp <- loan_data %>%
        dplyr::filter(rate_name == k) %>%
        dplyr::select(name:markup, rate_name, rate, dplyr::starts_with(k_))

      # extract names, remove rating e.g. "Aplus_rng_min" -> "rng_min"
      nms <- names(tmp) %>%
        gsub(paste0('^', k_), '', .)

      # return
      tmp %>%
        setNames(nms)
    })

    loan_data <- hold %>%
      dplyr::bind_rows(.) %>%
      dplyr::select(name:rate, rng_min, rng_max)

    devtools::use_data(loan_data, overwrite = TRUE)

    return(loan_data)

  } else loan_data

}
