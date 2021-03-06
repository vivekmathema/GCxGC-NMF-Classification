

row <- round(SamRate.comp*MPeriod)
col <- round(length(chromatoFile)/row)
redidu <- row-SamRate.comp*MPeriod
redidu.accum <-0
blank.id <- round(phase.shift*SamRate.comp+1)
cont.num <-0
mat <- matrix(1,row,col)


try(for (u in round(phase.shift*SamRate.comp+1):(length(chromatoFile)+round(phase.shift*SamRate.comp)) ){
if (u%%row==0){
redidu.accum <-redidu.accum + redidu
}
if ( redidu.accum > 1  ){
blank.id <- blank.id +1
mat[row*ceiling(blank.id/row)-(blank.id-1),ceiling( (u-round(phase.shift*SamRate.comp))/row )] <- chromatoFile[round(u-phase.shift*SamRate.comp)]
blank.id <- blank.id +1
mat[row*ceiling(blank.id/row)-(blank.id-1),ceiling( (u-round(phase.shift*SamRate.comp))/row )] <- chromatoFile[round(u-phase.shift*SamRate.comp)]

redidu.accum <- redidu.accum -1 
} else {

blank.id <- blank.id +1
mat[row*ceiling(blank.id/row)-(blank.id-1),ceiling( (u-round(phase.shift*SamRate.comp))/row )] <- chromatoFile[round(u-phase.shift*SamRate.comp)]


}
})


#�O���t��
red_blue <- colorRampPalette(rev(c("#7F0000", "red", "#FF7F00", "yellow", "#7FFF7F", "cyan", "#007FFF", "blue", "#00007F"))) #https://oku.edu.mie-u.ac.jp/~okumura/stat/colors.html
red_blue.alpha <- colorRampPalette(rev(c("#7F000025", "#FF000025", "#FF7F0025", "#FFFF0025", "#7FFF7F25", "#00FFFF25", "#007FFF25", "#0000FF25", "#00007F25")),alpha =T )
zz1 <- t(apply(as.matrix(mat[1:nrow(mat),1:ncol(mat)]),2,rev))
xx1 <- (1:nrow(zz1))/col*RTruntime+RTini.Del
yy1 <-(((1:ncol(zz1))/row*re.MPeriod)) + DeleteRow.lower
max.zz<-max(zz1)

cat("xx1,yy1,zz1 are calculated.")
writeLines(sep="\n","")
