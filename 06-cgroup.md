Cgroups are included in Kernel with a bunch of cgroup types
```sh
# ls /sys/fs/cgroup
```

Let's create a memory cgroup
```sh
# mkdir /sys/fs/cgroup/memory/demo
```

Kernel will automatically populate the new directory with necessary files
```sh
# ls /sys/fs/cgroup/memory/demo
```

Assign current process with the new cgroup
```sh
# echo $$ > /sys/fs/cgroup/memory/demo/tasks
```

Check our current PID in the new cgroup, and verify it gets assigned to it
```sh
# cat /sys/fs/cgroup/memory/demo/tasks
# cat /proc/self/cgroup
```

Let's limit this cgroup to 100MB of memory
```sh
# echo "100000000" > /sys/fs/cgroup/memory/demo/memory.limit_in_bytes
```

Also turn off swappiness
```sh
# echo "0" > /sys/fs/cgroup/memory/demo/memory.swappiness
```

Make a hungry Python script that will eat up memory
```sh
cat <<EOF> hungry.py
import time

f = open("/dev/urandom", "rb")
data = bytearray()

i = 0
while True:
    data.extend(f.read(10000000))
    i += 1
    print("%dmb" % (i*10,))
    time.sleep(1)
EOF
```

Now let's try to run the script, we can see it gets killed before eating 100 MB memory
```sh
# python3 hungry.py
```
