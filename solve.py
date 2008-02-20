from math import exp,sqrt
fp=open('tmp-mean.csv', 'w')
fp1=open('tmp-sd.csv', 'w')
alpha, mu = 1.0, 0.1
X,Y,Z =0.0, 0, 0
fp.write('time,X,Y,Z\n')
fp1.write('time,X,Y,Z\n')
for time in range(0,51):
	X = alpha/mu*(1.0-exp(-mu*time))
	if time == 5:
		Z=1
		Y=1
	if time == 10:
		Z=0
	fp.write(str(time) + ',' +  str(X) + ',' + str(Y) + ',' + str(Z)+'\n')
	fp1.write(str(time) + ',' +  str(sqrt(X)) + ',' + str(Y) + ',' + str(Z)+'\n')
fp.close()
