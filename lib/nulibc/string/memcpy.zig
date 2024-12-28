const options = @import("options");

pub fn memcpy(noalias dest: [*]u8, noalias src: [*]const u8, n: usize) callconv(.C) [*]const u8 {
    // FIXME: @memcpy builtin segfaults
    for (dest[0..n], src[0..n]) |*d, s| d.* = s;
    return dest;
}

comptime {
    if (options.use_exports) {
        @export(&memcpy, .{ .name = "memcpy" });
    }
}