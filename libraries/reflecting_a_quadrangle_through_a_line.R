
reflecting_a_quadrangle_through_a_line <- function( quadrangle ){ 
  ### creating the output object ( duplicating the input filled with NAs)
  result <- quadrangle
  
  # Identifying the rows to change the sign
  rows_to_reflect_abscisse <- apply(apply(quadrangle , 2 , is.inf), 1 , all)

  # Changing the sign of the appropriate rows
  numeric_rows_to_reflect_abscisse <- gsub("FALSE", 1,   rows_to_reflect_abscisse ) # Don't touch the rows/points that on the line that means they have some value different than Inf  
  numeric_rows_to_reflect_abscisse <- gsub("TRUE", -1,  numeric_rows_to_reflect_abscisse ) # Change the X sign of the rows/points that don't touch the line (only Infs rows )

  #
  mode( numeric_rows_to_reflect_abscisse ) <- "numeric" 
  
  
  result[ , colnames(quadrangle)[1]  ] <- numeric_rows_to_reflect_abscisse*quadrangle[ , colnames(quadrangle)[1]  ]
  return(result)
  
} 
