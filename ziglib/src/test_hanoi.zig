const std = @import("std");

const hanoi = @import("hanoi.zig");

test "test_get_hanoi_value_at_index" {
    const A001511 = [_]u32{
        1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1, 5, 1, 2, 1, 3, 1, 2, 1, 4,
        1, 2, 1, 3, 1, 2, 1, 6, 1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1, 5,
        1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1, 7, 1, 2, 1, 3, 1, 2, 1, 4,
        1, 2, 1, 3, 1, 2, 1, 5, 1, 2, 1, 3, 1, 2, 1, 4, 1, 2, 1, 3, 1, 2, 1, 6,
        1, 2, 1, 3, 1, 2, 1, 4, 1,
    };
    for (A001511, 0..) |v, i| {
        try std.testing.expectEqual(
            v - 1,
            hanoi.get_hanoi_value_at_index(@intCast(i)),
        );
    }
}

test "get_hanoi_value_incidence_at_index" {
    var hanoiValues: [100]u32 = undefined;
    for (0..100) |i| {
        hanoiValues[i] = hanoi.get_hanoi_value_at_index(@intCast(i));
    }

    for (0..100) |n| {
        var count: u32 = 0;
        for (0..n) |j| {
            if (hanoiValues[j] == hanoiValues[n]) {
                count += 1;
            }
        }
        std.debug.assert(count == hanoi.get_hanoi_value_incidence_at_index(
            @intCast(n),
        ));
    }
}

test "test_get_max_hanoi_value_through_index" {
    var hanoiValues: [1000]u32 = undefined; // Adjust type and size as necessary
    // Populate hanoiValues with Hanoi sequence values
    for (0..1000) |i| {
        var j: u32 = @intCast(i);
        hanoiValues[i] = hanoi.get_hanoi_value_at_index(j);
    }

    for (0..1000) |n| {
        var maxValue: i32 = @intCast(hanoiValues[0]);
        // Find max value up to n
        for (0..n) |j| {
            if (hanoiValues[j] > maxValue) {
                maxValue = @intCast(hanoiValues[j]);
            }
        }
        var m: u32 = @intCast(n);
        try std.testing.expectEqual(maxValue, hanoi.get_max_hanoi_value_through_index(m));
    }
}