postscript("figure1.ps", paper = "A4", height = 5, width = 7, horizontal = F)
par(mfrow=c(1,2))
mean = read.table("../dsmts-003-03-mean.csv", header=T,sep=",")
plot(mean$Time,mean$P, type='l', ylim=range(0, 100),
    xlab="Time", ylab= "Mean Population")
lines(mean$Time, mean$P2, lty=2)
legend(32, 15, c("P", "P2"), lty=1:2, cex=0.8)


sd = read.table("../dsmts-003-03-sd.csv", header=T,sep=",")
plot(sd$Time,sd$P, type='l', ylim=range(0, 6),
    xlab="Time", ylab= "Standard Deviation")
lines(sd$Time, sd$P2, lty=2)
legend(32, 0.9, c("P", "P2"), lty=1:2, cex=0.8)


dev.off()
