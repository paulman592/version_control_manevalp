library(stringr)

houseelf_data <- read.csv("houseelf-earlength-dna-data_1.csv")
get_gc_content <- function(seq){
  Gs <- str_to_upper(seq,"g")
  Cs <- str_to_upper(seq,"g")
  Gs <- str_count(Gs,"G")
  Cs <- str_count(Cs,"C")
  gc_content <- (Gs + Cs) / str_length(seq) * 100
  return(gc_content)
}

get_ear_length <- function(seq){
    #Determine the ear length category
    ear_lengths <- ifelse(seq > 10, "large", "small")
    return(ear_lengths)
}

ears <- get_ear_length(houseelf_data$earlength)
GC_prop <- get_gc_content(houseelf_data$dnaseq)

elf_data_all = data.frame(ID = character(length(houseelf_data$id)), Ear_size = ears,
  GC_content = GC_prop, stringsAsFactors = F)
elf_data_all

write.csv(elf_data_all, "elf_data_all.csv")
