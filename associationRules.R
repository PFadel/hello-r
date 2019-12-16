# install.packages("arules")
# install.packages("arulesViz")

# BDI
# Os valores básicos são:
#   0-9 indicam que o indivíduo não está deprimido,
#   10-18 indicam depressão leve a moderada,
#   19-29 indicam depressão moderada a severa,
#   30-63 indicam depressão severa.

require("arules")


data <- read.transactions(file="alterado.csv",
                          header=TRUE,
                          sep=",")

itemLabels(data)

data_rules <- apriori (data,
                       parameter = list(support = 0.01, confidence = 0.01),
                       ,appearance = list(rhs = 3, default = "lhs" ))

print("______________________TOP_10_RULES______________________")

inspect(head(sort(data_rules, by = "lift"), 10))

print("______________________TOP_10_RULES______________________")
