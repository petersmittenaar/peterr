#' Return strongest n correlations in dataframe
#' 
#' Takes a dataframe and calculates pairwise correlations between all numeric/logical variables. Returns a tibble with strongest n correlations. Might also return the p-value in the future. 
#' @param df dataframe (e.g. tibble)
#' @param n number of strongest correlations to return
#' @param method type of correlation, see \code{\link{stats::cor}}
#' @param use how to deal with missing values, see \code{\link{stats::cor}}
#' @return tibble with columns var1, var2, r
#' @seealso \code{\link{stats::cor}} which this function wraps
#' @export
#' @examples 
#' CorGetNStrongest(iris)
CorGetNStrongest <- function(df, n=10, method='pearson', use='pairwise.complete.obs') {
  
  df = dplyr::select_if(df, function(x) is.numeric(x) | is.logical(x))
  if (ncol(df) < 2) {
      warning('No numeric or logical columns available for correlating')
      return(NA)
  }

  r = cor(df, method=method, use=use)
  rdf = suppressMessages(r %>% as.table() %>%
   tibble::as_tibble(.name_repair = 'universal') %>% 
   dplyr::rename(var1 = `...1`, var2 = `...2`, r=n) %>%
   # remove symmetry
   dplyr::transmute(var1n = pmin(var1, var2), var2n=pmax(var1, var2), r) %>% 
   dplyr::distinct() %>%
   dplyr::filter(var1n != var2n) %>%
   dplyr::arrange(dplyr::desc(abs(r))) %>%
   dplyr::filter(dplyr::row_number() <= n))

   return(rdf)
}