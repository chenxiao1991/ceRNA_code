setwd("")
df <- read.table("network.txt",sep = "\t",row.names = 1,header = T)
head(df)
#install.packages("ggalluvial")
library(ggalluvial)


mycol <- rep(c("#223D6C","#D20A13","#FFD121","#088247","#11AA4D","#58CDD9","#7A142C","#5D90BA","#029149","#431A3D","#91612D","#6E568C","#E0367A","#D8D155","#64495D","#7CC767",
"#223D6C","#D20A13","#FFD121","#088247","#11AA4D","#58CDD9","#7A142C","#5D90BA","#029149","#431A3D","#91612D","#6E568C","#E0367A","#D8D155","#64495D","#7CC767",
"#223D6C","#D20A13","#FFD121","#088247","#11AA4D","#58CDD9","#7A142C","#5D90BA","#029149","#431A3D","#91612D","#223D6C","#D20A13","#FFD121","#088247","#11AA4D","#58CDD9","#7A142C","#5D90BA","#029149","#431A3D","#91612D","#6E568C","#E0367A","#D8D155","#64495D","#7CC767"
,"#223D6C","#D20A13","#FFD121","#088247","#11AA4D","#58CDD9","#7A142C","#5D90BA","#029149","#431A3D","#91612D","#6E568C","#E0367A","#D8D155","#64495D","#7CC767"),3)


UCB_lodes <- to_lodes_form(df[,1:ncol(df)],
                           axes = 1:ncol(df),
                           id = "Cohort")
dim(UCB_lodes)

head(UCB_lodes)
tail(UCB_lodes)

ggplot(UCB_lodes,
       aes(x = x, stratum = stratum, alluvium = Cohort,
           fill = stratum, label = stratum)) +
  scale_x_discrete(expand = c(0, 0)) + 
  geom_flow(width = 1/12) + 
  geom_stratum(alpha = .9,width = 1/15) + 
  geom_text(stat = "stratum", size = 1.2,color="black") + 
  
 
  scale_fill_manual(values = mycol) +

  xlab("") + ylab("") +
  theme_bw() + 
  theme(panel.grid =element_blank()) + 
  theme(panel.border = element_blank()) + 
  theme(axis.line = element_blank(),axis.ticks = element_blank(),axis.text = element_blank()) + 
  ggtitle("")+
  guides(fill = FALSE) 

ggsave("sankey3.pdf")
## Saving 6 x 6 in image






#������ֻѡ����һ�������������˴�ֻ����һ�к͵�����

UCB_lodes <- to_lodes_form(df[,c(1,3)],
                           axes = 1:2,
                           id = "Cohort")
dim(UCB_lodes)


ggplot(UCB_lodes,
       aes(x = x, stratum = stratum, alluvium = Cohort,
           fill = stratum, label = stratum)) +
  scale_x_discrete(expand = c(0, 0)) + 
  
  #��aes.flow���������ߴ��ı�������ɫ�͸��ı�һ�¡�
  #Ĭ����forward���˴���backward��
  geom_flow(width = 1/8,aes.flow = "backward") +
  
  coord_flip() + #��ת90��
  geom_stratum(alpha = .9,width = 1/10) +
  geom_text(stat = "stratum", size = 3,color="black") +

  #��������٣�������scale_fill_brewer���޸�type��palette��������ѡ����ɫ������������ɫ�����ο���ͼ���ֱ��Ӧtype�����ġ�Seq������qual������Div��
  #scale_fill_brewer(type = "Div", palette = "BrBG") +
  
  #�������̫�࣬��Ҫ��ǰ���Լ�д����ɫ����
  scale_fill_manual(values = mycol) +

  xlab("") + ylab("") +
  theme_bw() + 
  theme(panel.grid =element_blank()) + 
  theme(panel.border = element_blank()) + 
  theme(axis.line.x = element_blank(),axis.ticks = element_blank(),axis.text.x = element_blank()) + #��ʾ��������
  ggtitle("") +
  guides(fill = FALSE) 
ggsave("sankey2.pdf")
## Saving 6 x 3 in image
citation("ggalluvial")