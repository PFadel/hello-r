# install.packages("arules")
# install.packages("arulesViz")

# BDI
# Os valores básicos são:
#   0-9 indicam que o indivíduo não está deprimido,
#   10-18 indicam depressão leve a moderada,
#   19-29 indicam depressão moderada a severa,
#   30-63 indicam depressão severa.

require("arules")


data <- read.transactions(file="all_participants_alt.csv",
                          header=TRUE,
                          sep=",")

itemLabels(data)

courseLabels <- list("Administra<e7><e3>o P<fa>blica",
                 "Antropologia",
                 "Arquivologia",
                 "Biblioteconomia",
                 "Biomedicina",
                 "Ci<ea>ncia Ambiental",
                 "Ci<ea>ncia da Computa<e7><e3>o",
                 "Ci<ea>ncias Biol<f3>gicas",
                 "Ci<ea>ncias Econ<f4>micas",
                 "Cinema e Audiovisual",
                 "Din<e2>mica dos Oceanos e da Terra",
                 "Direito",
                 "Doutorado",
                 "Economia",
                 "Engenharia de Agroneg<f3>cios",
                 "Engenharia de Biossistemas",
                 "Engenharia de Produ<e7><e3>o",
                 "Engenharia de Recursos H<cd>dricos e do Meio ambiente",
                 "Engenharia de Telecomunica<e7><f5>es",
                 "Engenharia El<e9>trica",
                 "Engenharia Mec<e2>nica",
                 "Engenharia Qu<ed>mica",
                 "F<ed>sica",
                 "Faculdade de Turismo e Hotelaria",
                 "Farm<e1>cia",
                 "Filosofia",
                 "Fonoaudiologia",
                 "Geof<ed>sica",
                 "Geografia",
                 "Hist<f3>ria",
                 "Hotelaria",
                 "Letras",
                 "M<e3>e",
                 "Matem<e1>tica",
                 "Odontologia",
                 "Pedagogia",
                 "Processos Gerenciais",
                 "Psicologia",
                 "Qu<ed>mica",
                 "Seguran<e7>a P<fa>blica",
                 "Servi<e7>o Social",
                 "Sistemas de Informa<e7><e3>o",
                 "Sociologia",
                 "Sozinho",
                 "Turismo")

# rules <- apriori(projectDisc,
#                  parameter = list(supp=0.0001,
#                                   conf=0,
#                                   target = "rules",
#                                   maxtime=0,
#                                   maxlen=2),
#                  appearance = list(rhs=c("wasted=nenhum",
#                                          "wasted=pouco",
#                                          "wasted=muito",
#                                          "wasted=médio",
#                                          "rework=nenhum",
#                                          "rework=pouco",
#                                          "rework=muito",
#                                          "rework=médio",
#                                          "extra=nenhum",
#                                          "extra=pouco",
#                                          "extra=muito",
#                                          "extra=médio")))

data_rules <- apriori(data,
                      parameter = list(supp = 0.02,
                                       target = "rules",
                                       conf = 0),
                      appearance = list(rhs=c("1")))

print("______________________TOP_10_RULES______________________")

inspect(head(sort(data_rules, by = "lift"), 10))

print("______________________TOP_10_RULES______________________")
