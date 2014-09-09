# Plots Figure 5 for weinstein manuscript to IOVS

fig5.df = read.csv("weinstein-neutral-density-three-way-2014-09-09.csv", header = TRUE)

require( ggplot2 )

p = ggplot( data=fig5.df, mapping=aes( effect, threshold, stimulus, eye ) )

# See http://sape.inf.usi.ch/quick-reference/ggplot2/geom_linerange
p + geom_linerange( data=fig5.df, mapping = aes( x=effect, ymin=ci.lower, ymax=ci.upper, colour=stimulus, linetype=eye ), width=0.2, size=1) +
  geom_point(fill="white", size=4, shape=21) +
  geom_text( aes( x=7.5, y=0.1, label="p=.041"), size=5 ) +
  geom_segment( data=fig5.df, aes( x=7.5, y=(threshold[7]+threshold[8])/2, xend=7.5, yend=threshold[7]), width=0.2, 
                arrow = arrow( length=unit(0.2,"cm")), show_guide=F ) +
  geom_segment(data = fig5.df, aes( x=7.5, y=(threshold[7]+threshold[8])/2, xend=7.5, yend=threshold[8], width=0.2 ),
               arrow=arrow(length=unit(0.2,"cm")), show_guide=F ) +
  xlab("Interaction Effect") +
  ylab("Threshold") +
  ggtitle("Thresholds by diagnostic group, stimulus, and filter")
