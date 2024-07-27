Alright, so I am going to go with Zig, I think your explanation about short term frustrations with carbon makes sense overall. I will watch it from the sidelines for now. 

Focusing in on Zig, and how I intend to approach the development process, my first intention is to continue getting familiar with Zig v0.13.0 stable. 

**Slightly longer term:**

I typically learn my best when working on projects that are long form, & made up of many small tasks/issues that I need to work through. This, with guidance, often provides me with the best learning experiences in my opinion. 

For that reason, I will be selecting a Zig project based on my overall interests that seeks to establish the impact I intend to leave 

For this I will be taking heavy inspiration from Rapid7’s Metasploit framework, & aiming to develop a similar module based REPL TUI app, expanding on features offered by not only the open source msfconsole, & other metasploit community tools like the Ruby Rex exploit development library but even emulating some of the more advanced automation features from metasploit’s enterprise platform 

The goal of this project is to make multiple libraries for each aspect I need to build this msfconsole style REPL in Zig v0.13.0 (within reason)

- basic CLI App Library
    - Has good input acceptance handling
    - beautiful TUI rendering
        - Advanced component rendering within TUI
            - Table
            - JSON
            - Block
            - Etc
            - 
    - Uses a combination of BBcode & formatting strings to make beautiful text displays
- exploit development tooling similar to
    - pythons Pwntools
    - Rapid7’s Rex ruby library
    - Go-exploit open source go based exploit development tools

- Packet crafting & advanced clients
    - Inspired by
        - Impacket by forta
        - Scapy
- Data storages


---

As it stands, here is the file tree for the project I am working on:

```bash
[  7:48PM ]  [ user@ip:~/ZigSploit(main✗) ]
 $ tree .
.
├── build.zig
├── build.zig.zon
├── docs
│   └── planning.md
├── README.md
└── src
    ├── lib
    │   └── repl.zig
    ├── main.zig
    └── root.zig

4 directories, 7 files

```


I have a few things I need to do to get this project off the ground, but I am excited to get started.

I want to begin by restructuring the project to be more modular, and to have a better build system. I will be using Zig's build system to do this, and I will be using the `std.debug` package to help me with debugging.

I want to add more tooling to the `src/lib`, and I want to begin by adding a `src/lib/terminal.zig` file that will handle all of the terminal related functions. I will also be adding a `src/lib/ansi.zig` file that will handle all of the ANSI escape codes.


