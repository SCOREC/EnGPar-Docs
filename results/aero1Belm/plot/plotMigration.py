#!/usr/bin/env /opt/anaconda/bin/python3
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

def getValues(lines,keys):
    for line in lines:
        for k in keys:
            if k.key in line:
                k.get(line)
                break

class totMinMaxAvg:
    def __init__(self,key):
        self.key=key
        #self.header=['tot','setup','comm','build']
        self.header=['setup','comm','build']
        self.index=[]
        self.data=[]
    def get(self,line):
        print('get:', line)
        vals=line.split('=')[1] # trim off the description
        vals=vals[2:-2] # remove first and last '<' '>'
        vals=vals.replace(',','') # remove commas
        vals=vals.split(' ') # break on spaces
        print('vals',vals)
        build=float(vals[-1].strip())
        comm=float(vals[-2].strip())
        setup=float(vals[-3].strip())
        #total=float(vals[-4].strip())
        #self.data.append([total,setup,comm,build])
        self.data.append([setup,comm,build])

class processCount:
    def __init__(self,key):
        self.key=key
        self.data=[]
    def get(self,line):
        print('get:', line)
        p = line.split(' ')[2]
        print('procs:', int(p))
        self.data.append(int(p))


#if len(sys.argv) is not 3:
#    print('Usage: ', sys.argv[0], ' <log file> <log file>')
#    sys.exit()
plt.figure()

migrTime = totMinMaxAvg('max migration time (s) <total, setup, comm, build>')
procs = processCount('pcu peers')

keys=[migrTime,procs]

for fname in sys.argv[1:]:
  print(fname)
  f = open(fname,'r')
  lines=f.readlines()
  getValues(lines,keys)
  f.close()

print('migrTime:')
for d in migrTime.data:
    print(d)

print('procs:', procs.data)
print('header:', migrTime.header)
ar = np.array(migrTime.data)
print('np array:', ar)
df = pd.DataFrame(ar,index=procs.data,columns=migrTime.header)
print('df:', df)
ax = df.plot.bar(stacked=True)
ax.set_xlabel('processes')
ax.set_ylabel('time (s)')
plt.show()
