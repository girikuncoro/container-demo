We should restrict process from reassigning its own cgroup by running it from cgroup namespace, now we no longer see `demo` cgroup
```sh
# unshare -C
# cat /proc/self/cgroup
```

Let's cleanup our custom cgroup, by reassigning 
```sh
# exit
# echo $$ > /sys/fs/cgroup/memory/tasks
# rmdir /sys/fs/cgroup/memory/demo
```
