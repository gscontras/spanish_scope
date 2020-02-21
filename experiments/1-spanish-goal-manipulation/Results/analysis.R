library(ggplot2)
library(reshape2)
library(lme4)
library(dplyr)

setwd("~/git/spanish_scope/experiments/1-spanish-goal-manipulation/results/")

source("helpers.r")

d = read.csv("results.csv",header=T)

unique(d$language)

d = d[d$lived=="both8"&d$years=="mostlive",]

# only Spanish as native language
d = d[d$language!=""&
        d$language!="Chile"&
        d$language!="México"&
        d$language!="Castellano y asturiano",]
unique(d$language)

length(unique(d$participant_id)) # n=586 (600)

################################

t <- d

e_numeral_s = bootsSummary(data=t[t$quantifier=="numeral",], measurevar="response", groupvars=c("context","number","QUD"))

e_numeral_plot = ggplot(data=e_numeral_s,aes(x=number,y=response,fill=context))+
  geom_bar(stat="identity",color="black",position=position_dodge())+
  geom_errorbar(aes(ymin=bootsci_low, ymax=bootsci_high, x=number, width=0.1),position=position_dodge(0.9))+
  ylim(0,1)+
  ylab("endorsement rate") +
  labs(fill="early-success")+
  facet_wrap(~QUD)+
  theme_bw()#+
e_numeral_plot
#ggsave("spanish-numeral.png")


e_quantifier_s = bootsSummary(data=t[t$quantifier=="every",], measurevar="response", groupvars=c("context","QUD"))

e_quantifier_plot = ggplot(data=e_quantifier_s,aes(x=QUD,y=response,fill=context))+
  geom_bar(stat="identity",color="black",position=position_dodge())+
  geom_errorbar(aes(ymin=bootsci_low, ymax=bootsci_high, x=QUD, width=0.1),position=position_dodge(0.9))+
  ylim(0,1)+
  ylab("endorsement rate") +
  labs(fill="early-success")+
  #facet_wrap(~QUD)+
  theme_bw()#+
e_quantifier_plot
#ggsave("spanish-quantifier.png")


context_s = bootsSummary(data=t[t$quantifier=="numeral",], measurevar="response", groupvars=c("context","number"))

context_plot = ggplot(data=context_s,aes(x=number,y=response,fill=context))+
  geom_bar(stat="identity",color="black",position=position_dodge())+
  geom_errorbar(aes(ymin=bootsci_low, ymax=bootsci_high, x=number, width=0.1),position=position_dodge(0.9))+
  ylim(0,1)+
  #labs("order\npreference")+
  #facet_wrap(~QUD)+
  theme_bw()#+
#ggsave("../results/english-numeral-context.png")
context_plot


e_quantifier_no_context_s = bootsSummary(data=d[d$quantifier=="every",], measurevar="response", groupvars=c("QUD"))

e_quantifier_no_context_plot = ggplot(data=e_quantifier_no_context_s,aes(x=QUD,y=response))+
  geom_bar(stat="identity",color="black",position=position_dodge())+
  geom_errorbar(aes(ymin=bootsci_low, ymax=bootsci_high, x=QUD, width=0.1),position=position_dodge(0.9))+
  ylim(0,1)+
  ylab("endorsement rate") +
  #labs(fill="early-success")+
  #facet_wrap(~QUD)+
  theme_bw()#+
e_quantifier_no_context_plot
#ggsave("spanish-quantifier-no-context.png")