# [Zig][] programing language <sup><sub>[FAQ][3037203843]</sub></sup> rc

[zig]: https://github.com/ziglang/zig
[3037203843]: https://github.com/ziglang/zig/wiki/FAQ

*   DOC [Async][] [roadmap][] [status][751123532]

[async]: https://en.wikipedia.org/wiki/Async/await
[roadmap]: https://en.wikipedia.org/wiki/Technology_roadmap
[751123532]: https://github.com/ziglang/zig/wiki/FAQ#what-is-the-status-of-async-in-zig "What is the status of async in Zig"

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
