Let's run process in a network namespace
```sh
$ sudo unshare -n chroot rootfs /bin/bash
```

We can see now we have a separate network interfaces than host
```sh
# ip link
```

From host, let's create veth peer, assign one end to our network namespace
```sh
$ sudo ip link add veth0 type veth peer name veth1
$ sudo ip link set veth1 netns $PID
$ sudo ip address add 10.1.1.2/24 dev veth0
$ sudo ip link set dev veth0 up
```

We'll bring the interface in our network namespace up
```sh
# ip address add 10.1.1.3/24 dev veth1
# ip link set dev veth1 up
```

From inside network namespace, ping the host IP
```sh
# ping 10.1.1.2
```

From host, ping the container IP
```sh
$ ping 10.1.1.3
```
