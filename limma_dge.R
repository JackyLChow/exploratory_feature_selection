library(limma)

# load data
counts <- data.frame(read_csv("Documents/BFX_proj/exploratory_feature_selection/input_data/counts.csv"))
rownames(counts) <- counts$gene
counts <- counts[, 2:ncol(counts)]
norm_counts <- log2(counts + 1)

meta <- read_csv("Documents/BFX_proj/exploratory_feature_selection/input_data/meta.csv")

# limma pipeline
design_ <- model.matrix(~ factor(meta$treatment), levels = c("control", "SBRT"))
l_ <- lmFit(norm_counts, design_)
e_ <- eBayes(l_)
deg_ <- topTable(e_, n = Inf)
deg_ <- data.frame(gene = rownames(deg_), deg_)

# export
write.csv(deg_, "~/Documents/BFX_proj/exploratory_feature_selection/output_data/limma_dge.csv", row.names = F)