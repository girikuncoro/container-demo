Let's create a simple go file that will bind to port 80 on host
```sh
$ cat <<EOF> listen.go
package main

import (
  "fmt"
  "net"
  "os"
)

func main() {
	if _, err := net.Listen("tcp", ":80"); err != nil {
		fmt.Fprintln(os.Stdout, err)
		os.Exit(2)
	}
	fmt.Println("success")
}
EOF
```

Build the golang script and run not as root, bind error will occur
```sh
$ go build -o /tmp/listen listen.go
$ /tmp/listen
listen tcp :80: bind: permission denied
```

Now, add capability so that `/tmp/listen` can have permission to bind to host port
```sh
$ sudo setcap cap_net_bind_service=+ep /tmp/listen
$ getcap /tmp/listen
```

The problem is when we become root, we have all the capabilities
```sh
$ sudo su
# capsh --print
```

Let's try to remove one capability
```sh
# capsh --drop=cap_chown --
# whoami
root
# touch foo
# chown giri:giri foo
chown: changing ownership of 'foo': Operation not permitted
```
