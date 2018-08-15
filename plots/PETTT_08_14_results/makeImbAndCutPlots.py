#!/usr/bin/env python
from __future__ import print_function
import sys
import getopt
import numpy as np
import matplotlib.pyplot as plt
import re

def makelog(keys):
    log = {}
    for k in keys:
        log[k] = []
    return log

def parse(line):
  l,sep,r = line.partition('>')
  s = r.split(' ')
  maxCnt = s[1]
  minCnt = s[2]
  avgCnt = s[3]
  imb    = s[4].strip()
  return maxCnt, minCnt, avgCnt, imb

def getData(logs,key,valKey,entry):
  valkeyToIdx = {'max':0, 'min':1, 'avg':2, 'imb':3}
  assert(valKey in valkeyToIdx)
  validx = valkeyToIdx[valKey]
  imb = []
  procs = []
  for f in logs:
      procs.append(int(logs[f][0]))
      log=logs[f][1]
      assert(len(log[key]) > entry)
      vals=log[key][entry]
      assert(len(log[key][entry]) > validx)
      imb.append(float(vals[validx]))
  return procs, imb

def makeImbalancePlot(x,initY,finalY,initName,finalName,ymax,title,outname):
  #set the font and linewidth
  plt.style.use(['grayscale']+[userstyle])
  
  fig = plt.figure(figsize=(16,9))
  
  ## the lines
  plt.plot(x, initY, label=initName, linestyle="dashed")
  plt.plot(x, finalY, label=finalName)
  plt.legend(loc='upper left')
  plt.xticks(x)
  ## labels
  plt.ylabel("Imbalance (max/avg)")
  plt.title(title)
  plt.xlabel("Processes")
  plt.ylim((1.0,ymax))
  #create major grid lines
  plt.grid(b=True, axis='y', which='major', linestyle='-')
  #plt.show()
  print('outname', outname)
  fig.savefig(outname)

def makeEdgeCutPlot(x,initY,finalY,initName,finalName,ymax,title,outname):
  #set the font and linewidth
  plt.style.use(['grayscale']+[userstyle])
  
  fig = plt.figure(figsize=(16,9))
  
  ## the lines
  plt.plot(x, initY, label=initName, linestyle="dashed")
  plt.plot(x, finalY, label=finalName)
  plt.legend(loc='upper left')
  plt.xticks(x)
  ## labels
  plt.ylabel("Average Edge Cut")
  plt.title(title)
  plt.xlabel("Processes")
  plt.ylim((0.0,ymax))
  #create major grid lines
  plt.grid(b=True, axis='y', which='major', linestyle='-')
  #plt.show()
  print('outname', outname)
  fig.savefig(outname)

def usage():
  print('-x <process counts>'+
        '-f <log files> '+
        '-t <plot title> '+
        '-o <output file name> '+
        '[-v <vtx imbalance ymax>] '+
        '[-e <edge imbalance ymax>] '+
        '[-c <edge cut ymax>] '+
        '[-s <style file>]')

try:
    opts,args = getopt.getopt(sys.argv[1:],'x:t:o:v:e:c::s:f:')
except getopt.GetoptError as err:
  print(str(err))
  usage()
  sys.exit(1)

options = dict(opts)
if '-t' not in options or \
   '-x' not in options or \
   '-f' not in options or \
   '-o' not in options:
  print('options',options)
  usage()
  sys.exit(1)
userstyle=None
if '-s' in options:
  userstyle=options['-s']
title = options['-t']
outname = options['-o']
x = [ int(i) for i in options['-x'].split() ]
logfiles = [ str(i) for i in options['-f'].split() ]

keys=["Local Vertex Imbalance",
      "Edges type 0",
      "Edge Cut"]

logs = {}
log = {}
procIdx = 0
for f in logfiles:
  print('file: ',f)
  f = open(f,'r')
  log = makelog(keys)
  print('log',log)
  for line in f:
      for k in keys:
          m = re.search(k, line)
          if m:
              maxCnt, minCnt, avgCnt, imb = parse(line)
              print('key ', k, 'max min avg imb', 
                      maxCnt, minCnt, avgCnt, imb)
              log[k].append([maxCnt, minCnt, avgCnt, imb])
  f.close()
  logs[f] = [x[procIdx], log]
  procIdx = procIdx+1


procs, initvtximb = getData(logs,keys[0],'imb',0)
procs, finalvtximb = getData(logs,keys[0],'imb',1)
ymax = float(max(initvtximb)*1.05)
if '-v' in options:
  ymax = float(options['-v'])
makeImbalancePlot(procs,initvtximb,finalvtximb,"ParMETIS", "EnGPar", ymax,
        title+' Vtx '+outname, outname+"_vtximb")

procs, initedgeimb = getData(logs,keys[1],'imb',0)
procs, finaledgeimb = getData(logs,keys[1],'imb',1)
print('init edge imb', initedgeimb)
print('final edge imb', finaledgeimb)
ymax = float(max(initedgeimb)*1.05)
if '-e' in options:
  ymax = float(options['-e'])
makeImbalancePlot(procs,initedgeimb,finaledgeimb,"ParMETIS", "EnGPar", ymax,
        title+' Edge '+outname, outname+"_edgeimb")

procs, initAvgEdgeCut = getData(logs,keys[2],'avg',0)
procs, finalAvgEdgeCut = getData(logs,keys[2],'avg',1)
ymax = float(max(finalAvgEdgeCut)*1.05)
if '-c' in options:
  ymax = float(options['-c'])
makeEdgeCutPlot(procs,initAvgEdgeCut,finalAvgEdgeCut,"ParMETIS", "EnGPar", ymax,
        title+' edge '+outname, outname+"_avgedgecut")


