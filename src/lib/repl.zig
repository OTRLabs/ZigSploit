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
    
}


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
}


pub fn repl_factory() !void {
    // this function is used to create a new REPL instance within an application.
    // it returns a new instance of the REPL struct.
    // the REPL struct is defined below.
    const allocator = std.heap.page_allocator;
    //
    //var application_repl =

}
