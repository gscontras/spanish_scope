# Load ggplot2
library(ggplot2)

# Create data
data <- data.frame(
  QUD=c("None","Many", "All") ,  
  response=c(0.2811466072455673,0.36634588972698934,0.6349921886602219)
)
#model prediction
# Barplot
high_many_qud = ggplot(data, aes(x=reorder(QUD, response),y=response)) + 
  geom_bar(stat = "identity",fill = c("#d87609","#b58a08", "#879b04"),color ="black", position=position_dodge())+ 
  ylim(0,1)+
  ylab("endorsement rate") +
  xlab("QUD")+
  theme_bw()
high_many_qud + theme(text = element_text(size = 25))
ggsave("model_pre.png")
########

# Create data for Spanish
data <- data.frame(
  QUD=c("None","Many", "All") ,  
  response2=c(0.4363080506623963
,0.4836014213445037
,0.6355700133392889)
)
#model prediction
# Barplot
high_many_qud = ggplot(data, aes(x=reorder(QUD, response2),y=response2)) + 
  geom_bar(stat = "identity",fill = c("#d87609","#b58a08", "#879b04"),color ="black", position=position_dodge())+ 
  ylim(0,1)+
  ylab("endorsement rate") +
  xlab("QUD")+
  theme_bw()
high_many_qud + theme(text = element_text(size = 25))
ggsave("spanish_pre.png")
  
#colors
fill = c("#d87609","#b58a08", "#879b04")
