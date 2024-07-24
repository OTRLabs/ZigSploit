// Zig REPL Library
// For use with Zig v0.13.0 Stable

// This is a simple REPL library for Zig. It is designed to be used in a Zig program to provide a REPL interface to the user.
const std = @import("std");

// directly import the print function from the standard library
const print = @import("std").debug.print;

// defining the struct for REPL commands
pub const REPLCommand = struct {
    // the REPLCommand struct is used to define a command that the user can execute in the REPL.
    // it contains the following fields:
    // - name: a string that is the name of the command
    // - description: a string that describes what the command does
    // - function: a function that is executed when the command is called
    name: []const u8,
    description: []const u8,
    // function: fn(repl: *REPL, args: []const []const u8) void,
    help_message: []const u8,
};

// defining the REPL struct
pub const REPL = struct {
    // the REPL struct is the main struct that is used to create a new REPL instance.
    // it contains the following fields:
    // - prompt: a string that is displayed to the user to prompt for input
    // - history: a list of strings that contains the history of the user's input
    // - commands: a list of strings that contains the commands that the user can execute
    // - exit_command: a string that is used to exit the REPL
    // - exit_message: a string that is displayed when the user exits the REPL
    // - exit: a boolean that is set to true when the user exits the REPL
    // - input: a string that contains the user's input
    // - output: a string that contains the output of the user's input
    // - error: a string that contains any error messages
    // - run: a function that is used to run the REPL
    // - display_prompt: a function that is used to display the prompt
    // - display_output: a function that is used to display the output
    // - display_error: a function that is used to display any error messages
    // - display_exit_message: a function that is used to display the exit message
    // - clear_history: a function that is used to clear the history of the user's input
    // - clear_commands: a function that is used to clear the list of commands
    // - clear_output: a function that is used to clear the output
    // - clear_error: a function that is used to clear any error messages
    // - clear_input: a function that is used to clear the user's input
    // - clear_exit: a function that is used to clear the exit flag
    // - clear: a function that is used to clear the output, error messages, and user's input
    // - exit_repl: a function that is used to exit the REP
};

pub fn repl_factory() !void {
    // this function is used to create a new REPL instance within an application.
    // it returns a new instance of the REPL struct.
    // the REPL struct is defined below.

    // create a new instance of the REPL struct
    const u8: repl_prompt = "> ";
    var repl = REPL{
        // prompt: "> ",
        // history: std.ArrayList([]const u8).init(std.heap.page_allocator),
        // commands: std.ArrayList([]const u8).init(std.heap.page_allocator),
        // exit_command: "exit",
        // exit_message: "Exiting REPL...",
        // exit: false,
        // input: "",
        // output: "",
        // error: "",
        // run: run_repl,
        // display_prompt: display_prompt,
        // display_output: display_output,
        // display_error: display_error,
        // display_exit_message: display_exit_message,
        // clear_history: clear_history,
        // clear_commands: clear_commands,
        // clear_output: clear_output,
        // clear_error: clear_error,
        // clear_input: clear_input,
        // clear_exit: clear_exit,
        // clear: clear,
        // exit_repl: exit_repl,
    };

    //var application_repl =

}

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
