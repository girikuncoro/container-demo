From host, we can see all namespaces for particular process under `/proc/<pid>/ns`
```sh
$ ps aux | grep /bin/bash
$ sudo su
# ls /proc/<pid>/ns
```

Enter the existing process and mount namespace
```sh
# nsenter --pid=/proc/<pid>/ns/pid --mount=/proc/<pid>/ns/mnt chroot rootfs /bin/bash
```

Now that we have entered existing process and mount namespace, we can see 2 `/bin/bash` processes
```sh
# ps aux
```

Try to run `top` from here
```sh
# top
```

Obviously we can see the process from the first `/bin/bash` and kill it
```sh
# ps aux
# kill <top pid>
```
