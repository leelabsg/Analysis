##Convert_Annovar function
Convert_Annovar<-function(anno,result){
  
  #read the annotation result as table (only the first to 16th columns are needed)
  anno<-fread(anno)
  anno<-anno[1:16]
  
  if(!is.numeric(anno$Chr[1])){
    
    for(i in 1:22){
      anno$Chr[anno$Chr==paste0('chr',as.character(i))]<-i
    }
    anno$Chr[anno$Chr=='chrX']<-'X'
    anno$Chr[anno$Chr=='chrY']<-'Y'
    anno$Chr[anno$Chr=='M']<-'MT'
    anno$Chr[anno$Chr=='chrM']<-'MT'
  }
  write.csv(anno,file=result,row.names=F)  
}
