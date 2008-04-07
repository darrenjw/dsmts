#$LastChangedDate: 2006-04-17 09:17:19 +0100 (Mon, 17 Apr 2006) $
#$Rev: 42 $
#$Author: darren $

# code for running the suite on FERN...

testmodel <- function(model="dsmts-001-01",n=10,tspath=".",
     verb=TRUE,plot=FALSE,meanthresh=3,sdthresh=5)
 {
        stem=paste(tspath,model,sep="/")
        modelfile=paste(stem,".xml",sep="")
        meanfile=paste(stem,"-mean.csv",sep="")
        sdfile=paste(stem,"-sd.csv",sep="")
        meantab=read.csv(meanfile,header=TRUE)
        meantab=meantab[,2:ncol(meantab)]
        sdtab=read.csv(sdfile,header=TRUE)
        sdtab=sdtab[,2:ncol(sdtab)]
        xbartab=meantab
        stab=sdtab
        xbartab[]=0
        stab[]=0
        for (i in 1:n) {
                if (verb==TRUE)
                        print(i)
                runcmd=paste("fern",modelfile,
                       "50 1",
                       "> /tmp/run.out")
                system(runcmd)
                outtab=read.table("/tmp/run.out",
                        header=FALSE)
                outtab=outtab[,2:ncol(outtab)]
                xbartab=xbartab+outtab
                stab=stab+(outtab-meantab)*(outtab-meantab)
        }
        xbartab=xbartab/n
        stab=stab/n
        ztab=sqrt(n)*(xbartab-meantab)/sdtab
        ytab=sqrt(n/2)*((stab/(sdtab*sdtab))-1)
        ztab=as.matrix(ztab)
        ytab=as.matrix(ytab)
        meanfails=sum(abs(xbartab-meantab)>
                  meanthresh*sdtab/sqrt(n))
        sdfails=sum((ytab>sdthresh)|
                  (ytab<(-sdthresh)),na.rm=TRUE)
        if (verb==TRUE) {
                print(ztab)
                print(ytab)
        }
        if (plot==TRUE) {
               op=par(mfrow=c(2,1))
               plot(0,0,xlim=c(0,50), ylim=c(-10,10),
               xlab="Time", ylab="SDs from truth")
               title(main=paste("Mean diagnostics for model", model))
                abline(0,0,col="green")
                abline(meanthresh,0,col="red")
                abline(-meanthresh,0,col="red")
                for (i in 1:ncol(ztab))
                        lines(ts(ztab[,i],start=0),lwd=3)
                plot(0,0,xlim=c(0,50),ylim=c(-10,10),xlab="Time",ylab="SDs from truth")
                title(main=paste("SD diagnostics for model",model))
                abline(0,0,col="green")
                abline(sdthresh,0,col="red")
                abline(-sdthresh,0,col="red")
                for (i in 1:ncol(ztab))
                        lines(ts(ytab[,i],start=0),lwd=3)
                par(op)
        }
        print(paste(meanfails,"mean test fails"))
        print(paste(sdfails,"sd test fails"))
        c(meanfails,sdfails)
  }


testbatch <- function(mods="model-list",tspath=".",verb=FALSE,...)
 {
        listfile=paste(tspath,mods,sep="/")
        modlist=scan(listfile,what="text")
        cumfails=c(0,0)
        modfails=0
        for (filename in modlist) {
                print(filename)
                fails=testmodel(model=filename,tspath=tspath,verb=verb,...)
                cumfails=cumfails+fails
                if (sum(fails)>0)
                        modfails=modfails+1
        }
        print(paste(cumfails[1],"mean fails in total"))
        print(paste(cumfails[2],"sd fails in total"))
        print(paste(modfails,"distinct models with at least one fail"))
        modfails
 }

testbatch(n=1000)
# testbatch(n=5)

# eof
