// Zig REPL Library
// For use with Zig v0.13.0 Stable

// This is a simple REPL library for Zig. It is designed to be used in a Zig program to provide a REPL interface to the user.
const std = @import("std");

// directly import the print function from the standard library
const print = @import("std").debug.print;

// defining the struct for REPL commands
pub const Command = struct {
    name: []const u8,
    handler: fn ([]const u8) void,
};

pub const REPL = struct {
    prompt: []const u8,
    allocator: *std.mem.Allocator,
    commands: []const Command,

    pub fn run(self: *REPL) void {
        const stdin = std.io.getStdIn();
        const stdout = std.io.getStdOut();

        while (true) {
            stdout.writeAll(self.prompt) catch {};
            const line = stdin.readUntilDelimiterOrEofAlloc(self.allocator, '\n') catch continue;

            const trimmed_line = std.mem.trimLeft(line, " \t\n");
            if (trimmed_line.len == 0) continue;

            var found_command = false;
            for (self.commands) |command| {
                if (std.mem.startsWith(trimmed_line, command.name)) {
                    const args = trimmed_line[command.name.len..];
                    command.handler(args);
                    found_command = true;
                    break;
                }
            }

            if (!found_command) {
                std.debug.print("Unknown command: {s}\n", .{trimmed_line});
            }

            self.allocator.free(line);
        }
    }
};
