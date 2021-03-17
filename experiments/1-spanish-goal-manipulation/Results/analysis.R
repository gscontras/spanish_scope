library(ggplot2)
library(reshape2)
library(lme4)
library(dplyr)

setwd("/Users/Abimael/documents/GitHub/spanish_scope/experiments/1-spanish-goal-manipulation/results/")
#setwd("~/git/spanish_scope/experiments/1-spanish-goal-manipulation/Results/")


source("helpers.r")

d = read.csv("results.csv",header=T)

full_data <- d
nrow(full_data) #n=762

every_data=full_data[full_data$quantifier=="every",]
nrow(every_data) #n=400

d <- every_data

length(unique(d$language))
length(unique(d$participant_id))

d = d[d$lived=="both8"&d$years=="mostlive",]

# only Spanish as native language
d = d[d$language!=""&
        d$language!="Chile"&
        d$language!="México"&
        d$language!="Castellano y asturiano",]
unique(d$language)

length(unique(d$participant_id)) # n=310 (400)

#write.csv(d,"spanish-results.csv")


################################

t <- d



e_quantifier_no_context_s = bootsSummary(data=d[d$quantifier=="every",], measurevar="response", groupvars=c("QUD"))
e_quantifier_no_context_s

#e_quantifier_no_context_s = e_quantifier_no_context_s[nrow(e_quantifier_no_context_s):1,]

e_quantifier_no_context_plot = ggplot(data=e_quantifier_no_context_s,aes(x=reorder(QUD, response),y=response))+
  geom_bar(stat="identity", fill = c("#d87609","#b58a08", "#879b04"),color = "black", position=position_dodge())+
  geom_errorbar(aes(ymin=bootsci_low, ymax=bootsci_high, x=QUD, width=0.1),position=position_dodge(0.9))+
  ylim(0,1)+
  ylab("human endorsement\n") +
  xlab("\nQUD") +
  #labs(fill="early-success")+
  #facet_wrap(~QUD)+
  theme_bw()
e_quantifier_no_context_plot #+ theme(text = element_text(size = 25))   
#ggsave("spanish-quantifier-no-context.png",height=2,width=2.5)





## fitting a model to predict results

d$QUD <- factor(d$QUD,levels=c("many","all","none"))

summary(lmer(response~QUD+(1|item),data=d))




