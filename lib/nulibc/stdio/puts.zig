const std = @import("std");
const options = @import("options");

pub fn puts(s: [*:0]const c_char) callconv(.C) usize {
    const slice: [*:0]const u8 = @ptrCast(@alignCast(s));
    const stdout = std.io.getStdOut();

    const len = stdout.write(@ptrCast(@alignCast(s[0..std.mem.len(slice)]))) catch return 0;
    stdout.writeAll("\n") catch return 0;
    return len;
}

comptime {
    if (options.lib_variant) |lib_variant| {
        if (lib_variant == .c) {
            @export(&puts, .{ .name = "puts" });
        }
    }
}
