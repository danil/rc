# [Zig][] programing language rc

[zig]: https://github.com/ziglang/zig

## HOWTO [Hello, World!][]

```zig
const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, World!\n", .{});
}
```

```sh
$ zig run hello.zig
Hello, World!
```

[hello, world!]: https://ziglang.org/documentation/master/#Hello-World
