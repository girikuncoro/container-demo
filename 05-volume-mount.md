From host, we create a readonly file that will get mounted inside the container
```sh
$ mkdir readonlyfiles
$ echo "Hello from Gojek!" > readonlyfiles/hello.txt
```

Enter the container and mount with the `readonlyfiles` directory on host
```sh
$ mkdir rootfs/var/readonlyfiles
$ sudo su
# nsenter --mount=/proc/$PID/ns/mnt mount --bind -o ro $PWD/readonlyfiles $PWD/rootfs/var/readonlyfiles 
```

From inside container, we can now see the text file
```sh
# cat /var/readonlyfiles/hello.txt
```

But it's a readonly
```sh
# echo "Gopay is awesome" > /var/readonlyfiles/hello.txt
```

