# Load ggplot2
library(ggplot2)

setwd("~/git/spanish_scope/experiments/plotcolor/")
setwd("~/GitHub/spanish_scope/experiments/plotcolor/")

# Create data for savinelli predictions - 2 items
data <- data.frame(
  QUD=c("none","many", "all") ,  
  response=c(0.21510005748200386,0.3475828246135107,0.6965678833914104)
)
#model prediction
# Barplot
high_many_qud = ggplot(data, aes(x=reorder(QUD, response),y=response)) + 
  geom_bar(stat = "identity",fill = c( "#879b04","#b58a08","#d87609"),color ="black", position=position_dodge())+ 
  ylim(0,1)+
  ylab("model endorsement\n") +
  xlab("\nQUD")+
  theme_bw()
high_many_qud #+ theme(text = element_text(size = 25))
ggsave("model_pre_2_items.png",height=2,width=2.5)
########

# Create data for Spanish
data <- data.frame(
  QUD=c("none","many", "all") ,  
  response2=c(0.4363080506623963
,0.4836014213445037
,0.6355700133392889)
)
#model prediction
# Barplot
high_many_qud = ggplot(data, aes(x=reorder(QUD, response2),y=response2)) + 
  geom_bar(stat = "identity",fill = c("#d87609","#b58a08", "#879b04"),color ="black", position=position_dodge())+ 
  ylim(0,1)+
  ylab("model endorsement\n") +
  xlab("\nQUD")+
  theme_bw()
high_many_qud #+ theme(text = element_text(size = 25))
#ggsave("spanish_pre.png",height=2,width=2.5)
  
#colors
fill = c("#d87609","#b58a08", "#879b04")

##new Spanish 2 items, same QUD priors*******************************************
# Create data for Spanish
data <- data.frame(
  QUD=c("none","many", "all") ,  
  response2=c(0.3435558276109251
              ,0.375133174207485
              ,0.6355697046731988)
)
#model prediction
# Barplot
high_many_qud = ggplot(data, aes(x=reorder(QUD, response2),y=response2)) + 
  geom_bar(stat = "identity",fill = c("#d87609","#b58a08", "#879b04"),color ="black", position=position_dodge())+ 
  ylim(0,1)+
  ylab("model endorsement\n") +
  xlab("\nQUD")+
  theme_bw()
high_many_qud #+ theme(text = element_text(size = 25))
#ggsave("spanish_pre_2.png",height=2,width=2.5)

#colors
fill = c("#d87609","#b58a08", "#879b04")