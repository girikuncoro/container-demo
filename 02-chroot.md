Trapping `/bin/bash` process inside `rootfs`
```sh
$ sudo chroot rootfs /bin/bash
$ ls /
$ which python3
/bin/python3
```

This looks like container, but it's not (yet)
```sh
$ ps aux
$ mount -t proc proc /proc
```

The current `rootfs` can see the whole processes running in the host
```sh
$ ps aux
```

Now, open other terminal and try running `top` from host
```sh
$ top
```

From inside `chroot`, we can see the `top` process, no process isolation!
```sh
$ ps aux | grep top
```

Since we're running `chroot` with `sudo`, we can kill the `top` process
```sh
$ whoami
$ kill <top pid>
```

This is where we need namespaces
