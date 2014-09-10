# Plots Figure 5 for weinstein manuscript to IOVS

fig5.df = read.csv("weinstein-neutral-density-three-way-2014-09-09.csv", header = TRUE)

library( ggplot2 )
library( grid ) # for arrow function

p = ggplot( data=fig5.df, mapping=aes( effect, threshold, stimulus, eye ) )

# See http://sape.inf.usi.ch/quick-reference/ggplot2/geom_linerange
p +  
  geom_linerange( data=fig5.df, mapping = aes( x=effect, ymin=ci.lower, ymax=ci.upper, linetype=eye ), size=1.5) +
  geom_point(mapping=aes( shape=stimulus ), size=5 ) +
  geom_text( aes( x=8, y=0.18, label="p=.041"), size=5 ) +
#   geom_segment( data=fig5.df, aes( x=7.5, y=(threshold[7]+threshold[8])/2, xend=7.5, yend=threshold[7]), width=0.2, 
#                 arrow = arrow( length=unit(0.2,"cm")), show_guide=F ) +
#   geom_segment(data = fig5.df, aes( x=7.5, y=(threshold[7]+threshold[8])/2, xend=7.5, yend=threshold[8], width=0.2 ),
#                arrow=arrow(length=unit(0.2,"cm")), show_guide=F ) +
  xlab("Stimulus x Filter x Diagnosis") +
  ylab("Threshold") +
  ggtitle("Thresholds by stimulus, filter, and diagnostic group") +
  theme(plot.title=element_text(size=22, face="bold")) +
  theme(axis.title.x=element_text(size=16, face="bold") ) +
  theme(axis.title.y=element_text(size=16, face="bold") ) +
  annotate("rect", xmin = 6.5, xmax = 8.5, ymin = -.35, ymax = .22,
           alpha = .2)
