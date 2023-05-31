counts <- read_csv("Documents/BFX_proj/_data_public/Chow_PNAS_2020/Chow_PNAS_normcounts.csv")
meta <- read_csv("Documents/BFX_proj/_data_public/Chow_PNAS_2020/Chow_PNAS_meta_med.csv")
meta$sample <- gsub("-", ".", meta$sample)

names(counts)[2:17] == meta$sample

write.csv(counts, "~/Documents/BFX_proj/exploratory_feature_selection/input_data/counts.csv", row.names = F)
write.csv(meta, "~/Documents/BFX_proj/exploratory_feature_selection/input_data/meta.csv", row.names = F)
