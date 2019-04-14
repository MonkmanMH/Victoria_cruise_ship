# some regex / vector code that might be helpful


## Julie's code


mutate(QID = str_trim(str_extract(X3, pattern = "[:alnum:]* "))) %>%  ## extract up to first space
  
  
tables <- tables %>% 
  mutate_if(is.factor, as.character)
tables <- tables %>% 
  mutate(non_empty = apply(tables, MARGIN = 1, FUN = function(x) length(x[x != ""]) )) %>% 
  filter(non_empty != 0)
  


syntax_rows_X1 <- c("FILTER BY QCOMP.", "CTABLES","Custom Tables","Notes","Output Created","Comments","Syntax","FILTER OFF.",
                    "  /TITLES","    CORNER=''.")
tables <- tables %>% filter(!(X1 %in% syntax_rows_X1))

syntax_rows_X2 <- c("Data","Active Dataset","Filter","Weight","Split File",
                    "N of Rows in Working Data File","Processor Time","Elapsed Time")
tables <- tables %>% filter(!(X2 %in% syntax_rows_X2))





## salvaged from the first cruise schedule attempt


# split at carriage and line return
str_split(testtext, regex("\u000D\u000A"))


# regex is the default -- can omit 
testtext_split <- str_split(testtext, "\u000D\u000A")


# use index to access specific rows
testtext_split[1]                    # pulls list 
testtext_split[[1]]                  # pulls all the items from the list
testtext_split[[1]][1]               # pulls 1st item from list

testtext_split[[1]][1:5]             # pulls range from list

testtext_split[[1]][-(1:5)]          # removes range from list




last_x_line_fun <- function(page, line_nums){
  last_x_line <- length(page) - line_nums + 1
  page[last_x_line:(length(page))]
}

p = 2
last_x_line_fun(vc_text_split[[p]], 4)

print("---------")
p = 10
last_x_line_fun(vc_text_split[[p]], 7)




#Will it loop?
  

for (p in 1:2){
  print(
    last_x_line_fun(vc_text_split[[p]], 4)
  )
}


# end line strip


end_linestrip_fun <- function(vect, line_nums){
  vic_vec_length <- length(vect)
  last_x_line <- length(vect) - line_nums
  vect[(length(length(vect)):last_x_line)]
}

# a test using the first page
end_linestrip_fun(vc_text_split[[1]], 4)

p01 <- vc_text_split[[1]][-(1:5)]          # removes range from list
p01






#Run the `end_linestrip_fun()` on the page one object we made earlier, `p01`


p01 <- end_linestrip_fun(p01, 4)

p01 


