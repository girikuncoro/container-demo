Isolate process and fork with `unshare`
```sh
$ sudo unshare -p -f --mount-proc=$PWD/rootfs chroot rootfs /bin/bash
$ ls
$ python3
```

Think itself as PID 1, and cannot see the rest of processes
```sh
$ ps aux
```

From host, we can still see `/bin/bash` process inside `chroot`
```sh
$ ps aux | grep /bin/bash
```
