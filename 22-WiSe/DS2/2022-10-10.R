---
title: "2022-10-10"
format: html
editor: source
---


# Tokenisierung

```{r}
library(tokenizers)
library(tidyverse)
library(tidytext)
library(hcandersenr)

the_fir_tree <- hcandersen_en %>%
  filter(book == "The fir tree") %>%
  pull(text)
```



```{r}
strsplit(the_fir_tree[1:2], "[^a-zA-Z0-9]+")
```


```{r}
txt <- "2022 stand im Zeichen der Energie-Krise"
regex_pattern <- "[^a-zA-Z0-9-]+"
strsplit(txt, regex_pattern)
```


```{r}
sample_vector <- c("Far down in the forest",
                   "grew a pretty little fir-tree")
sample_tibble <- tibble(text = sample_vector)
```


```{r}
sample_tibble %>%
  unnest_tokens(word, text, token = "words")
```


```{r}
hcandersen_en %>% 
  filter(book == "The fir tree") %>% 
  unnest_tokens(word, text) %>% 
  count(word, sort = TRUE)
```

