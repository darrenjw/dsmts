#$LastChangedDate: 2006-04-17 09:17:19 +0100 (Mon, 17 Apr 2006) $
#$Rev: 42 $
#$Author: colin $

genplots <- function(model)
{
	#read the data
	meanfile <- paste(model, "-mean.csv",sep="")
 	meandata <- read.table(meanfile, header=TRUE, sep=",")
	sdfile   <- paste(model, "-sd.csv",sep="")
	sddata   <- read.table(sdfile, header=TRUE, sep=",")
	n <- ncol(meandata)
	#determine limits for the y-axes
 	ymax1 <- max(meandata[,2])
	ymax2 <- max(sddata[,2])
	ymin1 <- min(meandata[,2])
	ymin2 <- min(sddata[,2])
	if(n>2){
		for(i in 3:n){
			ymax1 <- max(ymax1, max(meandata[,i]))
			ymax2 <- max(ymax2, max(sddata[,i]))
			ymin1 <- min(ymin1, min(meandata[,i]))
			ymin2 <- min(ymin2, min(sddata[,i]))
		}
	}
	#determine line types and labels
	ltype <- vector(mode="numeric",length=(n-1))
	labels <- vector(mode="character", length=(n-1))
	for(i in 1:(n-1)){
		ltype[i] <- i
		labels[i] <- names(meandata)[i+1]
	}
	#produce the mean pdf plot
	pdf(paste(model, "-mean.pdf",sep=""))
	plot(meandata[,1], meandata[,2], type="l", ylim=c(ymin1,ymax1), xlab="time", ylab="mean")
	if(n>2){
		for(i in 3:n){
			lines(meandata[,1], meandata[,i], lty=(i-1))
		}
	}
	legend(15, ymax1, labels, lty=ltype)
	dev.off()
	#produce the standard deviation plot
	pdf(paste(model, "-sd.pdf",sep=""))
	plot(sddata[,1], sddata[,2], type="l", ylim=c(ymin2,ymax2), xlab="time", ylab="standard deviation")
	if(n>2){
		for(i in 3:n){
			lines(sddata[,1], sddata[,i], lty=(i-1))
		}
	}
	legend(15, ymax2, labels, lty=ltype)
	dev.off()
}

allplots<-function(mods="model-list",tspath=".",verb=FALSE,...)
{
        listfile=paste(tspath,mods,sep="/")
        modlist=scan(listfile,what="text")
        for (filename in modlist) {
                print(filename)
		genplots(filename)
        }
}


allplots()


# eof

