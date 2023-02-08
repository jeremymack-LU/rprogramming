pacman::p_load(tidyverse,ggpath)

df <- read.csv('data/r_versions.csv')
df <- df |> mutate(label=paste0(label1,'\n',label2))

plot <- df |> 
  ggplot(aes(x=year,y=0)) +
  geom_hline(yintercept=0, color = "black", size=0.3) +
  
  geom_segment(aes(y=-1,yend=0,xend=year), color='black', size=0.2) +
  geom_text(aes(y=-1.3, label=year)) +
  geom_text(aes(y=-2, label=label)) +
  geom_segment(aes(xend=2025,yend=0),
               lineend = 1971, linejoin = 2025,
               size=0.3, 
               arrow = arrow(length = unit(0.1, "inches"))
  ) +
  geom_point(aes(y=0), size=3, color='black', fill='blue', shape=21) +
  scale_y_continuous(limits=c(-3,0.5)) +
  scale_x_continuous(limits=c(1971,2025),expand=c(0,0)) +
  theme_classic() +
  theme(axis.line.y=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x =element_blank(),
        axis.ticks.x =element_blank(),
        axis.line.x =element_blank(),
        legend.position = "bottom"
  )

ggsave(filename = 'timeline.jpeg',
       plot = plot,
       path = 'images',
       width = 7, height = 2, units = 'in',
       device='jpeg', dpi=600)

local_image_path <- system.file("r_logo.png", package = "ggpath")

df <- df |> mutate(path=local_image_path)

plot <- df |> 
  ggplot(aes(x=year,y=0)) +
  geom_hline(yintercept=0, color = "black", size=0.3) +
  
  geom_segment(aes(y=-1,yend=0,xend=year), color='black', size=0.2) +
  geom_text(aes(y=-1.3, label=year)) +
  geom_text(aes(y=-2, label=label)) +
  geom_segment(aes(xend=2025,yend=0),
               lineend = 1971, linejoin = 2025,
               size=0.3, 
               arrow = arrow(length = unit(0.1, "inches"))
  ) +
  geom_point(data=df[1,],aes(y=0), size=3, color='black', fill='blue', shape=21) +
  geom_from_path(data=df[-1,],aes(path = path), width = 0.025) +
  scale_y_continuous(limits=c(-2.5,0.5)) +
  scale_x_continuous(limits=c(1971,2025),expand=c(0,0)) +
  theme_classic() +
  theme(axis.line.y=element_blank(),
        axis.text.y=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),
        axis.ticks.y=element_blank(),
        axis.text.x =element_blank(),
        axis.ticks.x =element_blank(),
        axis.line.x =element_blank(),
        legend.position = "bottom"
  );plot

ggsave(filename = 'timeline.jpeg',
       plot = plot,
       path = 'images',
       width = 7, height = 2, units = 'in',
       device='jpeg', dpi=600)
