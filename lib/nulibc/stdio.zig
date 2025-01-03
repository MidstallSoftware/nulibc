const options = @import("options");

pub const FILE = opaque {};

pub const puts = @import("stdio/puts.zig");

comptime {
    if (options.lib_variant) |lib_variant| {
        if (lib_variant == .c) {
            _ = puts;
            _ = FILE;
        }
    }
}
