#' @version ps-1
#' @short DS-10-3
#' @title Working with built-in data sets
#' @descr
#' Exercise 10.3 adapted from Programming Skills for Data Science by
#' Micheal Freeman and Joel Ross. See:
#' https://github.com/programming-for-data-science/book-exercises
#' @end
#' @initial-vars
#' @end

#' @id -
#' @msg
#' Load R's "USPersonalExpenditure" data set using the `data()` function. This
#' is the code:
#'    > data("USPersonalExpenditure")
#' @end
#' @code
data("USPersonalExpenditure")
#' @end

#' @id ?
#' @msg
#' The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
#' it's not a dataframe (it's actually a data type called a matrix).
#'
#' Using the function `is.data.frame()` check if `USPersonalExpenditure` is a
#' data frame.
#' @end
#' @code
is_var_a_dataframe <- is.data.frame(USPersonalExpenditure)
#' @end

#' @id ?
#' @msg
#' Luckily, you can pass the USPersonalExpenditure variable as an argument to the
#' `data.frame()` function to convert it a dataframe.
#'
#' Do this, storing the result in a new variable, named `us_exp`.
#' @end
#' @code
us_exp <- data.frame(USPersonalExpenditure)
#' @end

#' @id ?
#' @msg
#' What are the column names of your dataframe?
#' @end
#' @code
c_names <- colnames(us_exp)
#' @end

#' @id -
#' @msg
#' Print the column names. Consider: Why are they so strange? Think about
#' whether you could use a number like 1940 with dollar notation!
#' @end

#' @id ?
#' @msg
#' What are the row names of your dataframe?
#' @end
#' @code
r_names <- rownames(us_exp)
#' @end

#' @id -
#' @msg
#' Add a column, named `category`, to your dataframe, which contains the rownames.
#' @end
#' @code
us_exp$category <- rownames(us_exp)
#' @end

#' @id ?
#' @msg
#' How much money was spent on personal care in 1940?
#' @end
#' @code
care_1940 <- us_exp["Personal Care", "X1940"]
#' @end

#' @id ?
#' @msg
#' How much money was spent on Food and Tobacco in 1960?
#' @end
#' @code
food_1960 <- us_exp["Food and Tobacco", "X1960"]
#' @end

#' @id ?
#' @msg
#' What was the highest expenditure category in 1960?
#' @end
#' @code
highest_1960 <- us_exp$category[us_exp$X1960 == max(us_exp$X1960)]
#' @end

#' @id ?
#' @msg
#' Define a function `lowest_category` that takes in a year as a parameter, and
#' returns the lowest spending category of that year.
#' @end
#' @check list(arg1=c(1940,1955))
#' @code
lowest_category <- function(year) {
  col <- paste0("X", year)
  us_exp$category[us_exp[, col] == min(us_exp[, col])]
}
#' @end

#' @id ?
#' @msg
#' Using your function, determine the lowest spending category of each year.
#' Hint: use the `sapply()` function to apply your function to a vector of
#' years
#' @end
#' @code
lowest <- sapply(seq(1940, 1960, 5), lowest_category)
#' @end
