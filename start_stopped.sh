#!/bin/bash
$@ &
PID=$!
kill -STOP ${PID}
ps -Lp $PID -o user,uid,euid,pid,ppid,lwp,nlwp,etime,pcpu,ni,pri_foo,sgi_p,psr,stat,wchan,min_flt,maj_flt,rss,vsz,args
echo -n "SIGSTOP(19) signal sent to ${PID}, press ENTER to send SIGCONT(18)."
read
kill -CONT ${PID}
ps --no-headings -Lp $PID -o user,uid,euid,pid,ppid,lwp,nlwp,etime,pcpu,ni,pri_foo,sgi_p,psr,stat,wchan,min_flt,maj_flt,rss,vsz,args
wait ${PID}
